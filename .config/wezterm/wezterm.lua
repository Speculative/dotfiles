local wezterm = require("wezterm")
return {
	color_scheme = "Tomorrow Night Bright",
	default_prog = { "/usr/bin/fish", "-l" },
	window_background_opacity = 0.6,
	hide_tab_bar_if_only_one_tab = true,
	font = wezterm.font("Iosevka NFM"),
	font_size = 18,
	-- Added to remove implicit mailto: hyperlinks on emails
	hyperlink_rules = {
		-- Matches: a URL in parens: (URL)
		{
			regex = "\\((\\w+://\\S+)\\)",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in brackets: [URL]
		{
			regex = "\\[(\\w+://\\S+)\\]",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in curly braces: {URL}
		{
			regex = "\\{(\\w+://\\S+)\\}",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in angle brackets: <URL>
		{
			regex = "<(\\w+://\\S+)>",
			format = "$1",
			highlight = 1,
		},
		-- Then handle URLs not wrapped in brackets
		{
			regex = "\\b\\w+://\\S+[)/a-zA-Z0-9-]+",
			format = "$0",
		},
	},
}
