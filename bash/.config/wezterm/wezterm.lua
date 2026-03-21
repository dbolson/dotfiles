local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.enable_scroll_bar = true
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.window_padding = {
	bottom = 0,
	left = 0,
	right = 15,
	top = 0,
}

config.keys = {
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "p",
		mods = "CTRL",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 30 },
		}),
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
}

return config
