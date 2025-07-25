# filepath: /Users/phanlong/.config/zshrc
# ~/.zshrc

# --- Command History Configuration ---
HISTFILE=~/.cache/.zsh_history     
HISTSIZE=10000                # Number of commands stored in current session
SAVEHIST=10000                # Number of commands saved to HISTFILE
setopt appendhistory          # Append to history, don't overwrite
setopt share_history          # Share history immediately between open terminals
setopt inc_append_history     # Write history immediately after typing command, don't wait for session end
setopt hist_ignore_dups       # Ignore consecutive duplicate commands in history
setopt hist_ignore_space      # Ignore commands that start with a space
setopt hist_expire_dups_first # Remove duplicate commands before unique ones when HISTFILE is full
setopt hist_verify            # Show command with expanded history before executing

# Show all history with the history command
alias history="history 0"

# --- Aliases and Color Configuration ---
alias ls='ls -G'              # Enable color for ls on macOS (-G is different from --color=auto on Linux)
alias ll='ls -alFG'           # Convenient alias for ls -alF with color
alias la='ls -AG'             # Show all files including hidden ones
alias l='ls -CFG'             # List in columns with file type indicators
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Color configuration for less (file reader)
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Format for time command
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# --- Shell Options ---
setopt auto_cd                # Automatically cd if directory name is typed
setopt correct                # Auto-correct minor command typos (may ask before correction)
setopt globdots               # Wildcard (*) also matches hidden files (starting with .)
setopt interactivecomments    # Allow comments in interactive mode
setopt magicequalsubst        # Enable filename expansion for arguments of the form 'anything=expression'
setopt nonomatch              # Hide error message if no match found with pattern
setopt notify                 # Report status of background jobs immediately
setopt numericglobsort        # Sort filenames numerically when it makes sense
setopt promptsubst            # Allow command substitution in prompt

# Don't consider certain characters as part of a word
WORDCHARS=${WORDCHARS//[\/]}  # Don't consider '/' part of a word

# Hide EOL mark ('%')
PROMPT_EOL_MARK=""

# --- Enable Zsh Command Completion System ---
# Necessary for advanced command completion (tab completion)
autoload -Uz compinit
compinit -d "$HOME/.cache/.zcompdump"

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

ZSH_SYNTAX_HIGHLIGHTING_DIR="$HOME/.config/zsh/zsh-syntax-highlighting"
ZSH_AUTOSUGGESTIONS_DIR="$HOME/.config/zsh/zsh-autosuggestions"
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

# --- Enable Plugins ---
source "$ZSH_SYNTAX_HIGHLIGHTING_DIR/zsh-syntax-highlighting.zsh"
# Advanced configuration for syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[path]=bold
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
ZSH_HIGHLIGHT_STYLES[assign]=none
ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold

source "$ZSH_AUTOSUGGESTIONS_DIR/zsh-autosuggestions.zsh"
# Change suggestion color for better visibility
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'

# --- Keybindings Configuration ---
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # history expansion on space
bindkey "^[^[[D" backward-word                    # Option+Left to move cursor back one word
bindkey "^[^[[C" forward-word                     # Option+Right to move cursor forward one word
# Additional bindings for WezTerm compatibility
bindkey "^[b" backward-word                       # Esc+b for backward-word (WezTerm Option+Left)
bindkey "^[f" forward-word                        # Esc+f for forward-word (WezTerm Option+Right)
# Removed Shift+Left/Right bindings as they are now handled by WezTerm for text selection
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# Create function to toggle between single/double line prompt
toggle_oneline_prompt() {
    if [ -z "$PROMPT_ALTERNATIVE" ]; then
        PROMPT_ALTERNATIVE=oneline
    else
        unset PROMPT_ALTERNATIVE
    fi
    # If you're using starship, you might need a different configuration
    # Please adjust accordingly for starship if needed
}
zle -N toggle_oneline_prompt
bindkey ^P toggle_oneline_prompt

# --- Initialize Starship ---

# Terminal title configuration
case "$TERM" in
xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty|wezterm)
    TERM_TITLE=$'\e]0;${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%n@%m: %~\a'
    ;;
*)
    ;;
esac

# Display terminal title and add new line before prompt
precmd() {
    # Print the previously configured title
    print -Pnr -- "$TERM_TITLE"

    # Add new line before prompt, but only if not the first line
    if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
        _NEW_LINE_BEFORE_PROMPT=1
    else
        print ""
    fi
}

export STARTSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export PATH
eval "$(starship init zsh)"
