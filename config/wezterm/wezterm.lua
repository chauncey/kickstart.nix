-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 15.0

config.font = wezterm.font_with_fallback {
  --'Fairfax Hax HD',
  'Monofur Nerd Font Mono',
  'Font Awesome 6 Free Regular',
  'Font Awesome 6 Free Solid',
  'Font Awesome 6 Free Brands Regular',
  'Font Awesome 5 Free Regular',
  'Font Awesome 5 Free Solid',
  'Font Awesome 5 Free Brands Regular',
  'FiraCode Nerd Font Mono',
  'nonicons',
}

config.warn_about_missing_glyphs = true

config.window_background_opacity = 0.8

config.enable_tab_bar = false

config.keys = {
  {
    key="F3",
    mods="",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key="F4",
    mods="",
    action = wezterm.action.SpawnTab('CurrentPaneDomain'),
  }
}

-- config.window_close_confirmation = {
--  "NeverPrompt",
--}


-- and finally, return the configuration to wezterm
return config

