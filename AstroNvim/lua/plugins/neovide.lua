if not vim.g.neovide then
	return {} -- do nothing if not in a Neovide session
else
	return {
		{
			"AstroNvim/astrocore",
			---@type AstroCoreOpts
			opts = {
				options = {
					opt = { -- configure vim.opt options
						-- configure font
						guifont = "FiraCode Nerd Font:h16",
						-- line spacing
						linespace = 0,
					},
					g = { -- configure vim.g variables
						-- configure scaling
						neovide_transparency = 0.95,
						neovide_refresh_rate = 60,
						neovide_cursor_vfx_mode = "railgun",
						neovide_cursor_vfx_particle_density = 80.0,
						neovide_scale_factor = 1,
						neovide_cursor_vfx_particle_phase = 1.5,
						neovide_cursor_smooth_blink = true,
						neovide_window_blurred = true,

						neovide_cursor_antialiasing = true,
						-- configure padding
						neovide_padding_top = 20,
						neovide_padding_bottom = 5,
						neovide_padding_right = 20,
						neovide_padding_left = 20,
					},
				},
			},
		},
		{
			"AstroNvim/astroui",
			---@type AstroUIOpts
			opts = {
				-- change colorscheme
				colorscheme = "catppuccin-mocha",
				-- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
				-- Icons can be configured throughout the interface
				icons = {
					-- configure the loading of the lsp in the status line
					LSPLoading1 = "⠋",
					LSPLoading2 = "⠙",
					LSPLoading3 = "⠹",
					LSPLoading4 = "⠸",
					LSPLoading5 = "⠼",
					LSPLoading6 = "⠴",
					LSPLoading7 = "⠦",
					LSPLoading8 = "⠧",
					LSPLoading9 = "⠇",
					LSPLoading10 = "⠏",
				},
			},
		},
	}
end
