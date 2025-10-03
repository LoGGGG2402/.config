# ~/.zshrc file for zsh interactive shells.

# ==============================================================================
# OPTIONS
# ==============================================================================
setopt autocd              # Change directory just by typing its name.
setopt interactivecomments # Allow comments in interactive mode.
setopt magicequalsubst     # Enable filename expansion for arguments.
setopt nonomatch           # Hide error message if there is no match for the pattern.
setopt notify              # Report the status of background jobs immediately.
setopt numericglobsort     # Sort filenames numerically.
setopt promptsubst         # Enable command substitution in prompt.
WORDCHARS='_-'             # Don't consider certain characters part of the word.
PROMPT_EOL_MARK=""         # Hide EOL sign ('%').

# ==============================================================================
# KEY BINDINGS
# ==============================================================================
bindkey -e                                    # Emacs key bindings.
bindkey ' ' magic-space                       # Do history expansion on space.
bindkey '^U' backward-kill-line               # Ctrl + U
bindkey '^[[3;5~' kill-word                   # Ctrl + Supr
bindkey '^[[3~' delete-char                   # Delete
bindkey '^[[1;5C' forward-word                # Ctrl + ->
bindkey '^[[1;5D' backward-word               # Ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history # Page Up
bindkey '^[[6~' end-of-buffer-or-history      # Page Down
bindkey '^[[H' beginning-of-line              # Home
bindkey '^[[F' end-of-line                    # End
bindkey '^[[Z' undo                           # Shift + Tab

# ==============================================================================
# COMPLETION
# ==============================================================================
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# ==============================================================================
# HISTORY
# ==============================================================================
HISTFILE=~/.cache/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # Delete duplicates first.
setopt hist_ignore_dups       # Ignore duplicated commands.
setopt hist_ignore_space      # Ignore commands that start with space.
setopt hist_verify            # Show command before running it.
setopt share_history          # Share command history between sessions.
alias history="history 0"

# ==============================================================================
# ALIASES & COLORS
# ==============================================================================
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:"

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
    alias ll='ls -l'
    alias la='ls -A'
    alias l='ls -CF'
fi

# ==============================================================================
# PLUGINS & INTEGRATIONS
# ==============================================================================
# Enable Syntax Highlighting (must be sourced before autosuggestions)
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Enable Auto Suggestions
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
fi

# Enable command-not-found handler
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

# ==============================================================================
# STARSHIP PROMPT
# ==============================================================================
# Set terminal title
case "$TERM" in
xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty|wezterm)
    TERM_TITLE=$'\e]0;${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%n@%m: %~\a'
    ;;
*)
    ;;
esac

precmd() {
    print -Pnr -- "$TERM_TITLE"
}

# Initialize Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
