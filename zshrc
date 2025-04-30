# ~/.zshrc

HISTFILE=~/.cache/zsh/.zsh_history     
HISTSIZE=10000                # Số dòng lệnh lưu trong phiên hiện tại
SAVEHIST=10000                # Số dòng lệnh lưu vào tệp HISTFILE
setopt appendhistory          # Ghi thêm vào lịch sử, không ghi đè
setopt share_history          # Chia sẻ lịch sử ngay lập tức giữa các terminal đang mở
setopt inc_append_history     # Ghi lịch sử ngay sau khi gõ lệnh, không đợi kết thúc phiên
setopt hist_ignore_dups       # Bỏ qua các lệnh lặp lại liên tiếp trong lịch sử
setopt hist_ignore_space      # Bỏ qua các lệnh bắt đầu bằng dấu cách

alias ls='ls -G'              # Bật màu cho ls trên macOS (-G khác với --color=auto trên Linux)
alias ll='ls -alFG'           # Alias tiện lợi cho ls -alF với màu
alias la='ls -AG'             # Hiện tất cả file kể cả file ẩn
alias l='ls -CFG'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

setopt auto_cd                # Tự động cd nếu gõ tên thư mục
setopt correct                # Tự động sửa lỗi gõ lệnh nhỏ (có thể hỏi trước khi sửa)
setopt globdots               # Lệnh wildcard (*) cũng khớp với file ẩn (bắt đầu bằng .) - bật nếu cần

# --- Kích hoạt hệ thống hoàn thành lệnh của Zsh ---
# Cần thiết cho việc hoàn thành lệnh nâng cao (tab completion)
# Đảm bảo dòng này chạy trước khi source các plugin completion (nếu có)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit && compinit -d "$HOME/.cache/zsh/.zcompdump"

ZSH_SYNTAX_HIGHLIGHTING_DIR="$HOME/.config/zsh/zsh-syntax-highlighting"
ZSH_AUTOSUGGESTIONS_DIR="$HOME/.config/zsh/zsh-autosuggestions"
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

# --- Kích hoạt các plugin ---
source "$ZSH_SYNTAX_HIGHLIGHTING_DIR/zsh-syntax-highlighting.zsh"
source "$ZSH_AUTOSUGGESTIONS_DIR/zsh-autosuggestions.zsh"

# --- Khởi tạo Starship ---
export STARTSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export PATH
eval "$(starship init zsh)"
