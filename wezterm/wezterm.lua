-- Wezterm's config file
local wezterm = require("wezterm")
local config = wezterm.config_builder()

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

config = {
	font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Medium", style = "Normal" }),
	-- font = wezterm.font("JetBrains Mono", { weight = "Medium", style = "Normal" }),
	font_size = 16,
	color_scheme = "Catppuccin Mocha",
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	show_new_tab_button_in_tab_bar = false,
	window_background_opacity = 0.7,
	macos_window_background_blur = 40,
	text_background_opacity = 1,
	adjust_window_size_when_changing_font_size = false,
	-- tab_bar_at_bottom = true,
	window_padding = {
		left = 20,
		right = 10,
		top = 10,
		bottom = 10,
	},
	exit_behavior = "Close",
	quit_when_all_windows_are_closed = true,
}
tabline.setup({
	options = {
		icons_enabled = true,
		theme = config.color_scheme,
		tabs_enabled = true,
		section_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
		component_separators = {
			left = "",
			right = wezterm.nerdfonts.ple_pixelated_squares_small,
		},
		tab_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
		theme_overrides = {
			tab = { active = { bg = "#cfe", fg = "#000" } },
		},
	},
	sections = {
		tabline_a = { "mode" },
		tabline_b = { wezterm.nerdfonts.seti_apple, "hostname", icons_only = true },
		tabline_c = { "" },

		tab_active = {
			{ "parent", padding = 0 },
			"/",
			{ "cwd", padding = { left = 0, right = 0 }, max_length = 10 },
			{ "zoomed", padding = 0 },
		},
		tab_inactive = { "process", padding = { left = 5, right = 5 } },
		tabline_x = { { "ram", throttle = 60 }, { "cpu", throttle = 60 } },
		tabline_y = { "datetime", "battery" },
		tabline_z = { "domain" },
	},
	extensions = {},
})
tabline.apply_to_config(config)

return config
