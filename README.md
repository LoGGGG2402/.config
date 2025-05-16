# 🛠️ Dotfiles Configuration

![Terminal](https://img.shields.io/badge/Terminal-Wezterm-blue)
![Shell](https://img.shields.io/badge/Shell-ZSH-green)
![Prompt](https://img.shields.io/badge/Prompt-Starship-yellow)
![Copilot](https://img.shields.io/badge/AI-GitHub_Copilot-orange)

A carefully crafted collection of configuration files for a modern, productive development environment on macOS.

## ✨ Featured Tools

| Tool | Description | Config Location |
|------|-------------|----------------|
| **[Zsh](https://www.zsh.org/)** | Shell with advanced features | `zshrc`, `zsh/` |
| **[Starship](https://starship.rs/)** | Fast, customizable cross-shell prompt | `starship/starship.toml` |
| **[Wezterm](https://wezfurlong.org/wezterm/)** | GPU-accelerated terminal | `wezterm/wezterm.lua` |
| **[GitHub Copilot](https://github.com/features/copilot)** | AI pair programming | `github-copilot/` |

## 📦 Installation

```bash
# Clone the repository
git clone https://github.com/LoGGGG2402/.config.git ~/.config

# Set up zsh configuration
cp ~/.config/zshrc ~/.zshrc
mkdir -p ~/.cache/zsh

# Install dependencies
brew install starship # Modern shell prompt
brew install --cask wezterm # Terminal emulator
```

## ⚡ Key Features

### ZSH Configuration

- **Enhanced History Management**: Intelligent history with deduplication and immediate sharing between terminals
- **Smart Auto-completion**: Through zsh-autosuggestions plugin
- **Syntax Highlighting**: Real-time command syntax highlighting
- **Intuitive Keybindings**: Customized for efficient navigation and text editing

### Starship Prompt

- **Minimalist Design**: Clean, information-dense prompt
- **Git Integration**: Visual indicators for repository status
- **Language Support**: Automatic detection of programming environments
- **Performance**: Lightning-fast prompt rendering

### Wezterm Terminal

- **GPU Acceleration**: Smooth rendering and scrolling
- **Custom Background**: Beautiful background with opacity control
- **Workspace Management**: Advanced tab and workspace organization
- **Split Panes**: Efficient window management

## ⌨️ Wezterm Keyboard Shortcuts

### Core Navigation
- **Leader Key**: `CMD + a` (3-second timeout)
- **Copy Mode**: `LEADER + [`
- **Command Palette**: `LEADER + :`

### Workspace Management
- **Show Workspace Launcher**: `LEADER + s` (fuzzy search)
- **Create New Workspace**: `LEADER + W` 
- **Rename Current Workspace**: `LEADER + r`

### Tab Management
- **Rename Current Tab**: `CMD + r`

### Pane Management
- **Split Vertically**: `LEADER + /`
- **Split Horizontally**: `LEADER + ;`
- **Rotate Panes**: `LEADER + Space`
- **Toggle Pane Zoom**: `LEADER + z`
- **Close Current Pane**: `CMD + e` (with confirmation)
- **Move Pane to New Tab**: `LEADER + m`
- **Resize Pane Mode**: `OPT + CMD + r` (then use SHIFT+<, SHIFT+_, SHIFT++, SHIFT+>)

## 🔧 Customization

Most configuration files include detailed comments explaining available options:

- **ZSH**: Edit `zshrc` to modify shell behavior
- **Starship**: Update `starship/starship.toml` for prompt customization
- **Wezterm**: Modify `wezterm/wezterm.lua` for terminal settings
- **Background**: Replace `wezterm/bg.jpg` with your preferred image

## 🔍 Preview

```
.config on  main [!+] 
❯                                              
```

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

💻 Happy coding! Feel free to fork and customize for your own workflow.