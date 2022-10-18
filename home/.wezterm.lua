local wezterm = require 'wezterm'

function font_with_fallback(preferred, params)
  local names = preferred
  local fallbacks = { 'Hack Nerd Font Mono', 'Noto Sans JP', 'JetBrains Mono' }
  if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    table.insert(fallbacks, 'Consolas')
    table.insert(fallbacks, 'Meiryo UI')
    table.insert(fallbacks, 'Yu Gothic UI')
  end
  if wezterm.target_triple == 'x86_64-apple-darwin' then
    table.insert(fallbacks, 'Monaco')
    table.insert(fallbacks, 'Menlo')
    table.insert(fallbacks, 'ヒラギノ丸ゴ ProN')
  end
  if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
    table.insert(fallbacks, 'Ubuntu Monospace')
    table.insert(fallbacks, 'DejaVu Sans')
    table.insert(fallbacks, 'Doroid Sans')
  end
  table.insert(fallbacks, 'monospace')
  for i = 1, #fallbacks do
    table.insert(names, fallbacks[i])
  end
  return wezterm.font_with_fallback(names, params)
end


return {
  ----------------- input
  use_ime = true,
  ime_preedit_rendering = 'System',
  default_cursor_style = 'BlinkingBar',
  
  ----------------- fonts
  font = font_with_fallback { 'JetBrainsMono Nerd Font Mono' },
  font_size = 14.0,
  
  ----------------- window
  initial_cols = 96,
  initial_rows = 24,
  color_scheme = "nord",
  
  scrollback_lines = 100000,
  enable_scroll_bar = true,
  
  ----------------- tab
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  
  ----------------- check update
  check_for_updates = true,
  check_for_updates_interval_seconds = 86400,
  show_update_window = true,

  ----------------- key bindings
  disable_default_key_bindings = true,

  keys = {

    -- basic config
    { key = 'c',          mods = 'SUPER',             action = wezterm.action.CopyTo 'Clipboard' },
    { key = 'v',          mods = 'SUPER',             action = wezterm.action.PasteFrom 'Clipboard' },
    { key = 'n',          mods = 'SHIFT|CTRL',        action = wezterm.action.SpawnWindow },

    { key = 't',          mods = 'SUPER',             action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
    { key = 'w',          mods = 'SUPER',             action = wezterm.action.CloseCurrentTab {confirm=true} },
    { key = '1',          mods = 'SUPER',             action = wezterm.action.ActivateTab(0) },
    { key = '2',          mods = 'SUPER',             action = wezterm.action.ActivateTab(1) },
    { key = '3',          mods = 'SUPER',             action = wezterm.action.ActivateTab(2) },
    { key = '4',          mods = 'SUPER',             action = wezterm.action.ActivateTab(3) },
    { key = '5',          mods = 'SUPER',             action = wezterm.action.ActivateTab(4) },
    { key = 'LeftArrow',  mods = 'SUPER',             action = wezterm.action.ActivateTabRelative(-1) },
    { key = 'RightArrow', mods = 'SUPER',             action = wezterm.action.ActivateTabRelative(1) },

    { key = 'LeftArrow',  mods = 'OPT',               action = wezterm.action.SendKey { key = 'b', mods = 'ALT', }, },
    { key = 'RightArrow', mods = 'OPT',               action = wezterm.action.SendKey { key = 'f', mods = 'ALT' }, },
    { key = 'LeftArrow',  mods = 'SHIFT',             action = wezterm.action.SendKey { key = 'a', mods = 'CTRL', }, },
    { key = 'RightArrow', mods = 'SHIFT',             action = wezterm.action.SendKey { key = 'e', mods = 'CTRL' }, },

    { key = 'UpArrow',    mods = 'SHIFT|CTRL',        action = wezterm.action.ActivatePaneDirection "Up" },
    { key = 'DownArrow',  mods = 'SHIFT|CTRL',        action = wezterm.action.ActivatePaneDirection "Down" },
    { key = 'LeftArrow',  mods = 'SHIFT|CTRL',        action = wezterm.action.ActivatePaneDirection "Left" },
    { key = 'RightArrow', mods = 'SHIFT|CTRL',        action = wezterm.action.ActivatePaneDirection "Right" },

    { key = '-',          mods = 'SUPER|CTRL',        action = wezterm.action.DecreaseFontSize },
    { key = '=',          mods = 'SUPER|CTRL',        action = wezterm.action.IncreaseFontSize },
    { key = '0',          mods = 'SUPER|CTRL',        action = wezterm.action.ResetFontSize },

    { key = 'UpArrow',    mods = 'SUPER|CTRL',        action = wezterm.action.ScrollToPrompt(-1) },
    { key = 'DownArrow',  mods = 'SUPER|CTRL',        action = wezterm.action.ScrollToPrompt(1) }, 
  },
}
