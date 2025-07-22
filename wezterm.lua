-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 20
config.color_scheme = "tokyonight"

-- Window opacity (0.0 = fully transparent, 1.0 = fully opaque)
config.window_background_opacity = 0.85

-- Key bindings
config.keys = {
  -- Create vertical pane with cmd+shift+|
  {
    key = "|",
    mods = "CMD|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  -- Create horizontal pane with cmd+shift+-
  {
    key = "-",
    mods = "CMD|SHIFT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  -- Vim-style pane navigation with CMD+hjkl
  {
    key = "h",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
}

-- Finally, return the configuration to wezterm:
return config
