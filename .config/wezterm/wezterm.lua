local wezterm = require("wezterm")
return {
	color_scheme = "Tomorrow Night Bright",
	default_prog = { "/usr/bin/fish", "-l" },
	window_background_opacity = 0.6,
	hide_tab_bar_if_only_one_tab = true,
	font = wezterm.font("Iosevka Nerd Font Mono"),
	font_size = 18,
}
