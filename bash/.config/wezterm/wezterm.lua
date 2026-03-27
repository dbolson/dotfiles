local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()
local act = wezterm.action

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.adjust_window_size_when_changing_font_size = false
config.animation_fps = 90
config.enable_scroll_bar = true
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.front_end = "WebGpu"
config.max_fps = 90
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
		action = act.DisableDefaultAssignment,
	},
	{
		key = "p",
		mods = "CTRL|SHIFT",
		action = act.SplitPane({
			direction = "Right",
			size = { Percent = 30 },
		}),
	},
	{
		key = "k",
		mods = "CMD",
		action = act.ClearScrollback("ScrollbackAndViewport"),
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = act.ActivatePaneDirection("Prev"),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = act.ActivatePaneDirection("Next"),
	},
	{
		key = "LeftArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.MoveTabRelative(-1),
	},
	{
		key = "RightArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.MoveTabRelative(1),
	},
}

return config
