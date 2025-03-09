-- Wezterm's config file
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = {
	font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Medium", style = "Normal" }),
	-- font = wezterm.font("JetBrains Mono", { weight = "Medium", style = "Normal" }),
	font_size = 16,
	animation_fps = 60,
	color_scheme = "Catppuccin Mocha",
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	show_new_tab_button_in_tab_bar = false,
	window_background_opacity = 0.8,
	macos_window_background_blur = 40,
	text_background_opacity = 0.6,
	adjust_window_size_when_changing_font_size = false,
	tab_bar_at_bottom = true,
	window_padding = {
		left = 10,
		right = 10,
		top = 20,
		bottom = 20,
	},
	exit_behavior = "Close",
	quit_when_all_windows_are_closed = true,
}
return config
