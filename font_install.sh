#!/bin/bash

# ==============================================================================
# Script to download and install Fira Code Nerd Font for all users
# ==============================================================================

# --- Configuration ---
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip"
FONT_DIR="/usr/local/share/fonts/FiraCodeNerdFont"
TMP_FILE="/tmp/FiraCode.zip"

# --- Helper Functions ---
function print_info() {
    echo -e "\e[34m[INFO]\e[0m $1"
}

function print_success() {
    echo -e "\e[32m[SUCCESS]\e[0m $1"
}

function print_error() {
    echo -e "\e[31m[ERROR]\e[0m $1" >&2
    exit 1
}

# --- Main Script ---

# 1. Check for root privileges
if [ "$EUID" -ne 0 ]; then
    print_error "Vui lòng chạy script này với quyền root (sử dụng sudo)."
fi

# 2. Check for dependencies (wget and unzip)
if ! command -v wget &> /dev/null; then
    print_error "'wget' không được cài đặt. Vui lòng cài đặt và thử lại."
fi

if ! command -v unzip &> /dev/null; then
    print_error "'unzip' không được cài đặt. Vui lòng cài đặt và thử lại."
fi

# 3. Download the font zip file
print_info "Đang tải Fira Code Nerd Font từ $FONT_URL..."
wget -q --show-progress -O "$TMP_FILE" "$FONT_URL"
if [ $? -ne 0 ]; then
    print_error "Tải font thất bại."
fi

# 4. Create destination directory
print_info "Tạo thư mục cài đặt font tại $FONT_DIR..."
mkdir -p "$FONT_DIR"
if [ $? -ne 0 ]; then
    print_error "Không thể tạo thư mục font."
fi

# 5. Unzip and install fonts
print_info "Giải nén và cài đặt font..."
unzip -o -q "$TMP_FILE" -d "$FONT_DIR"
if [ $? -ne 0 ]; then
    print_error "Giải nén font thất bại."
fi

# 6. Update the font cache
print_info "Cập nhật bộ đệm font hệ thống (font cache)..."
fc-cache -f -v &> /dev/null

# 7. Clean up
print_info "Dọn dẹp tệp tạm thời..."
rm "$TMP_FILE"

print_success "Fira Code Nerd Font đã được cài đặt thành công cho tất cả người dùng!"
