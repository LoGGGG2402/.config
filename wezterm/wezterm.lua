-- wezterm.lua
-- Configuration file for Wezterm Terminal Emulator

-- Load necessary Wezterm modules
local wezterm = require("wezterm")
local act = wezterm.action -- Alias for wezterm.action

-- Initialize the configuration table
local config = {}
-- Use the config builder if available (recommended for newer Wezterm versions)
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ====================================
-- Appearance and Basic Behavior Settings
-- ====================================

config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({
  { family = "JetbrainsMono Nerd Font", scale = 1.0 },
  -- Fallback fonts will be used if characters are missing
})

-- Window background
config.window_background_image = wezterm.config_dir .. "/bg.jpg" -- Relative path to background image
config.window_background_opacity = 0.7 -- Background opacity (0.0 transparent, 1.0 opaque)
config.window_background_image_hsb = { -- Adjust background image HSB
  brightness = 0.1,
  hue = 1.0,
  saturation = 0.4,
}
config.macos_window_background_blur = 10 -- Background blur effect (macOS only)

-- Window decorations and behavior
config.window_decorations = "RESIZE" -- Minimal decorations, removes system title bar
config.window_close_confirmation = "AlwaysPrompt" -- Ask for confirmation before closing
config.scrollback_lines = 3000 -- Maximum lines in scrollback buffer
config.default_workspace = "main" -- Default workspace name on startup

-- Dim inactive panes for focus
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.8
}

-- ====================================
-- Keybindings
-- ====================================

-- Leader key definition (CMD+a, 3-second timeout)
config.leader = { key = "a", mods = "CMD", timeout_milliseconds = 3000 }

-- Main keybindings list
config.keys = {
  -- Send Ctrl+a when Leader+Ctrl+a is pressed (useful for nested tmux/screen)
  { key = "a", mods = "LEADER|CTRL", action = act.SendKey { key = "a", mods = "CTRL" } },

  -- Wezterm features
  { key = "[", mods = "LEADER",      action = act.ActivateCopyMode },
  { key = ":", mods = "LEADER",      action = act.ActivateCommandPalette },

  -- Workspace management
  { key = "s", mods = "LEADER",      action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } }, -- Show workspace launcher
  { -- Create a new workspace via prompt
    key = "W", -- Leader + W
    mods = "LEADER",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Green" } },
        { Text = "Enter new Workspace name:" }, -- Prompt text in English
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line and line ~= "" then
          -- SwitchToWorkspace automatically creates if it doesn't exist
          window:perform_action(act.SwitchToWorkspace { name = line }, pane)
        end
      end)
    }
  },
  { -- Rename the current workspace via prompt
    key = "r",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Rename Workspace:" }, -- Prompt text in English
      },
      action = wezterm.action_callback(function(window, pane, line)
        -- This function runs after you enter text and press Enter
        if line and line ~= "" then -- Check if the user entered a non-empty name
          -- Get the name of the currently active workspace
          local current_workspace = wezterm.mux.get_active_workspace()
          -- Rename the current workspace to the name entered in the prompt
          wezterm.mux.rename_workspace(current_workspace, line)
        end
      end)
    }
  },


  -- Navigation/Editing helpers
  { key = 'LeftArrow', mods = 'OPT', action = act.SendKey({ key = 'b', mods = 'ALT' }) }, -- Move cursor back one word
  { key = 'RightArrow', mods = 'OPT', action = act.SendKey({ key = 'f', mods = 'ALT' }) }, -- Move cursor forward one word

  -- Tab management
  { -- Rename the current tab via prompt
    key = "r",
    mods = "CMD",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Rename Tab Title:" }, -- Prompt text in English
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end)
    }
  },

  -- Pane management
  { key = "/",          mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },   -- Split vertical
  { key = ";",          mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } }, -- Split horizontal
  { key = "phys:Space", mods = "LEADER", action = act.RotatePanes "Clockwise" },                          -- Rotate panes
  { key = "z",          mods = "LEADER", action = act.TogglePaneZoomState },                             -- Toggle pane zoom
  { key = "e",          mods = "CMD",    action = act.CloseCurrentPane { confirm = true } },              -- Close current pane (with confirmation)
  { -- Move current pane to a new tab
    key = 'm', -- Leader + m
    mods = 'LEADER',
    action = wezterm.action_callback(function(win, pane)
      local tab, window = pane:move_to_new_tab()
    end),
  },
  -- Activate pane resizing mode (uses key_table below) - Changed from Leader+r
  { key = "r", mods = "OPT|CMD", action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },
}

-- Custom key tables
config.key_tables = {
  -- Key table for pane resizing mode (activated by Leader + R) - Changed from Leader+r
  resize_pane = {
    { key = "<",      mods="SHIFT", action = act.AdjustPaneSize { "Left", 1 } }, -- Decrease size left
    { key = "_",      mods="SHIFT", action = act.AdjustPaneSize { "Down", 1 } }, -- Increase size down
    { key = "+",      mods="SHIFT", action = act.AdjustPaneSize { "Up", 1 } },   -- Increase size up
    { key = ">",      mods="SHIFT", action = act.AdjustPaneSize { "Right", 1 } }, -- Increase size right

    -- Exit resizing mode
    { key = "Escape", mods="NONE", action = "PopKeyTable" },
    { key = "Enter",  mods="NONE", action = "PopKeyTable" },
    { key = "r",      mods="NONE", action = "PopKeyTable" },
  },
}

-- ====================================
-- Tab Bar and Status Bar
-- ====================================

config.use_fancy_tab_bar = false       -- Disable fancy tab bar styling
config.status_update_interval = 1000   -- Status update interval (milliseconds)
config.tab_bar_at_bottom = true        -- Place tab bar at the bottom

-- Custom status bar update function
wezterm.on("update-status", function(window, pane)
  -- Left status: Workspace / Leader / Key Table state
  local stat = window:active_workspace()
  local stat_color = "#f7768e" -- Default color for workspace

  -- Use the key table name if active
  local key_table_name = window:active_key_table()
  if key_table_name then
    stat = key_table_name
    stat_color = "#7dcfff" -- Color for active key table
  end
  -- Show leader state if active (overrides key table name)
  if window:leader_is_active() then
    stat = "LDR"
    stat_color = "#bb9af7" -- Color for active leader
  end


  -- Right status: CWD and current command
  -- Helper function to get the basename from a path
  local basename = function(s)
     if not s then return "" end
     -- Normalize separators and get the last component
     s = s:gsub("\\", "/")
     local base = s:match("([^/]+)$")
     return base or s -- Return the original string if it has no slashes
  end

  -- Get current working directory
  local cwd_uri = pane:get_current_working_dir()
  local cwd = ""
  -- Check if cwd_uri is not nil and is a table with file_path or a string
  if cwd_uri then
      if type(cwd_uri) == "table" and cwd_uri.file_path then
          cwd = basename(cwd_uri.file_path)
      elseif type(cwd_uri) == "string" then
          -- Attempt to handle file URI string
          local path_str = cwd_uri:gsub("file://", "")
          -- Decode percent-encoded characters (e.g., %20 for space)
          path_str = wezterm.url_decode(path_str)
          cwd = basename(path_str)
      end
  end


  -- Get foreground process name
  local cmd_name = pane:get_foreground_process_name()
  local cmd = ""
  if cmd_name then
    cmd = basename(cmd_name)
  end

  -- Set status bar content
  window:set_left_status(wezterm.format({
    { Foreground = { Color = stat_color } },
    { Text = "  " },
    { Text = wezterm.nerdfonts.oct_table .. "  " .. stat }, -- Icon + status text
    { Text = " |" },
  }))

  window:set_right_status(wezterm.format({
    { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd }, -- Folder icon + CWD
    { Text = " | " },
    { Foreground = { Color = "#e0af68" } },
    { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd }, -- Code icon + command
    { Text = "  " },
  }))
end)
-- ====================================
-- Return the configuration object
-- ====================================
return config