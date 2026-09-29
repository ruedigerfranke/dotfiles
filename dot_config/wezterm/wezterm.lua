local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("OperatorMono Nerd Font", { weight = "Medium" })
config.font_size = 13
config.line_height = 1.2

config.color_scheme = "Catppuccin Mocha"

config.window_decorations = "RESIZE"
config.window_padding = {
	left = 24,
	top = 24,
	right = 24,
	bottom = 24,
}
config.window_background_opacity = 1.0

config.enable_tab_bar = false

return config
