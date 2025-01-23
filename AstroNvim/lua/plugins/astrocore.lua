-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		-- Configure core features of AstroNvim
		features = {
			large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
			autopairs = true, -- enable autopairs at start
			cmp = true, -- enable completion at start
			diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
			highlighturl = true, -- highlight URLs at start
			notifications = true, -- enable notifications at start
		},
		-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
		diagnostics = {
			virtual_text = true,
			underline = true,
		},
		-- vim options can be configured here
		options = {
			opt = { -- vim.opt.<key>
				tabstop = 4, -- sets vim.opt.tabstop
				expandtab = true, -- sets vim.opt.expandtab
				softtabstop = 4, -- Number of spaces inserted instead of a TAB character
				shiftwidth = 4, -- Number of spaces inserted when indenting
				relativenumber = true, -- sets vim.opt.relativenumber
				number = true, -- sets vim.opt.number
				spell = false, -- sets vim.opt.spell
				signcolumn = "yes", -- sets vim.opt.signcolumn to yes
				wrap = false, -- sets vim.opt.wrap
			},
			g = { -- vim.g.<key>
				-- configure global vim variables (vim.g)
				-- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
				-- This can be found in the `lua/lazy_setup.lua` file
			},
		},
		-- Mappings can be configured through AstroCore as well.
		-- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
		mappings = {
			-- first key is the mode
			n = {
				-- second key is the lefthand side of the map

				-- navigate buffer tabs
				["]b"] = {
					function()
						require("astrocore.buffer").nav(vim.v.count1)
					end,
					desc = "Next buffer",
				},
				["[b"] = {
					function()
						require("astrocore.buffer").nav(-vim.v.count1)
					end,
					desc = "Previous buffer",
				},

				-- mappings seen under group name "Buffer"
				["<Leader>bd"] = {
					function()
						require("astroui.status.heirline").buffer_picker(function(bufnr)
							require("astrocore.buffer").close(bufnr)
						end)
					end,
					desc = "Close buffer from tabline",
				},

				["<M-1>"] = {
					"<Cmd>ToggleTerm direction=float<CR>",
					desc = "ToggleTerm float",
				},

				["<M-2>"] = {
					"<Cmd>ToggleTerm size=10 direction=horizontal<CR>",
					desc = "ToggleTerm horizontal split",
				},

				["<M-3>"] = {
					"<Cmd>ToggleTerm size=80 direction=vertical<CR>",
					desc = "ToggleTerm vertical split",
				},

				["<M-j>"] = { ":m .+1<CR>==", desc = "Move line up" },
				["<M-k>"] = { ":m .-2<CR>==", desc = "Move line down" },

				["<M-v>"] = { "<Cmd>vsplit<CR>", desc = "Split vertical" },
				["<M-h>"] = { "<Cmd>split<CR>", desc = "Split horizontal" },

				["<TAB>rr"] = { "<Cmd>RustLsp run<CR>", desc = "Rust Run" },
				["<TAB>gr"] = { "<Cmd>GoRun<CR>", desc = "Go Run" },
				["<TAB>cb"] = {
					function()
						vim.cmd.vnew()
						vim.cmd.term()
						vim.api.nvim_win_set_width(0, 80)
						local job_id = vim.bo.channel
						vim.fn.chansend(job_id, "cmake -S . -B ./build -G Ninja && ninja -C build -v\r\n")
						vim.fn.chansend(job_id, "exit\r\n")
					end,
					desc = "C++ build",
				},

				["<TAB>cr"] = {
					function()
						vim.cmd.vnew()
						vim.cmd.term()
						vim.api.nvim_win_set_width(0, 80)
						local job_id = vim.bo.channel

						-- walker all files in ./bin
						local files = vim.fn.systemlist("/bin/ls ./bin")
						local executables = {}
						for _, file in ipairs(files) do
							if vim.fn.executable("./bin/" .. file) == 1 then
								executables = vim.list_extend(executables, { "./bin/" .. file })
							end
						end
						local joint = table.concat(executables, " && ")
						vim.fn.chansend(job_id, joint .. "\r\n")
					end,
					desc = "C++ Run",
				},

				["U"] = { "<C-r>", desc = "Undo" },

				["<Leader>n"] = false,
				-- ["<Leader>tp"] = false,
				-- ["<Leader>tl"] = false,

				["<Leader>h"] = false,

				-- tables with just a `desc` key will be registered with which-key if it's installed
				-- this is useful for naming menus
				-- ["<Leader>b"] = { desc = "Buffers" },

				-- setting a mapping to false will disable it
				-- ["<C-S>"] = false,
			},
			v = {

				["<M-j>"] = { ":m '>+1<CR>gv-gv", desc = "Move block up" },
				["<M-k>"] = { ":m '<-2<CR>gv-gv", desc = "Move block down" },

				["<M-v>"] = { "<Cmd>vsplit<CR>", desc = "Split vertical" },
				["<M-h>"] = { "<Cmd>split<CR>", desc = "Split horizontal" },
			},

			t = {
				["<M-1>"] = {
					"<Cmd>ToggleTerm<CR>",
					desc = "Toggleterm terminal",
				},

				["<M-2>"] = {
					"<Cmd>ToggleTerm<CR>",
					desc = "Toggle terminal",
				},

				["<M-3>"] = {
					"<Cmd>ToggleTerm<CR>",
					desc = "Toggleterm terminal",
				},
			},
		},
	},
}
