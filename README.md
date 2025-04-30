# Dotfiles Configuration

A collection of my personal configuration files for various tools and applications.

## Overview

This repository contains configuration files for:

- **zsh**: Shell configuration with plugins
  - zsh-autosuggestions
  - zsh-syntax-highlighting
- **starship**: Cross-shell prompt
- **wezterm**: A GPU-accelerated terminal emulator
- **GitHub Copilot**: AI pair programming tool

## Installation

Clone this repository into your home directory:

```bash
git clone https://github.com/LoGGGG2402/.config.git ~/.config
cp zshrc ~/.zshrc
mkdir ~/.cache/zsh
```

## Configuration Details

### Zsh

The Zsh configuration includes:
- Main configuration file: `zshrc`
- Plugins for autosuggestions and syntax highlighting

### Starship

Terminal prompt customization is handled through `starship/starship.toml`.

### Wezterm

Terminal emulator configuration in `wezterm/wezterm.lua` with custom background.

#### Wezterm Shortcuts Summary (From wezterm.lua)

Here is a list of the keyboard shortcuts configured in your wezterm.lua file.

**Main Keybindings (config.keys)**
- **Leader Key**: CMD + a (Press this combination first, then the next key within 3 seconds)
- **Send Ctrl+a**: LEADER + CTRL + a - Sends the Ctrl+a key combination
- **Copy Mode**: LEADER + [ - Activates Wezterm's copy mode
- **Command Palette**: LEADER + : - Activates the command palette
- **Show Workspace Launcher**: LEADER + s - Opens the Workspace launcher (fuzzy search)
- **Create New Workspace**: LEADER + W - Opens a prompt to enter a new Workspace name
- **Rename Current Workspace**: LEADER + r - Opens a prompt to rename the current Workspace
- **Move Cursor Back One Word**: OPT + LeftArrow (Equivalent to Alt + b)
- **Move Cursor Forward One Word**: OPT + RightArrow (Equivalent to Alt + f)
- **Rename Current Tab**: CMD + r - Opens a prompt to rename the Tab title
- **Split Pane Vertically**: LEADER + / - Splits the current pane vertically
- **Split Pane Horizontally**: LEADER + ; - Splits the current pane horizontally
- **Rotate Panes**: LEADER + Space - Rotates pane positions clockwise
- **Toggle Pane Zoom**: LEADER + z - Toggles the zoom state of the current pane
- **Close Current Pane**: CMD + e - Closes the current pane (with confirmation)
- **Move Pane to New Tab**: LEADER + m - Moves the current pane to a new tab
- **Activate Pane Resizing Mode**: OPT + CMD + r - Activates the resize_pane key table

**Pane Resizing Key Table (resize_pane)**  
(Activated by OPT + CMD + r)
- **Decrease Size Left**: SHIFT + <
- **Increase Size Down**: SHIFT + _
- **Increase Size Up**: SHIFT + +
- **Increase Size Right**: SHIFT + >
- **Exit Mode**: Escape or Enter or r

**Note**: OPT is usually the Alt key on non-Apple keyboards. CMD is the Command key on macOS.

## Customization

Feel free to modify any of these configuration files to suit your preferences. Most configuration files are well-commented to explain their functionality.

## License

This project is licensed under the MIT License - see the LICENSE file for details.