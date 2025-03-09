# homebrew for using ustc mirror
set -gx HOMEBREW_BREW_GIT_REMOTE "https://mirrors.ustc.edu.cn/brew.git"
set -gx HOMEBREW_CORE_GIT_REMOTE "https://mirrors.ustc.edu.cn/homebrew-core.git"
set -gx HOMEBREW_BOTTLE_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles"
set -gx HOMEBREW_API_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles/api"

# @note: for llvm
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib/unwind -lunwind"
set -gx PATH "/opt/homebrew/opt/llvm/bin" $PATH
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"
set -gx C "/opt/homebrew/opt/llvm/bin/clang"
set -gx CXX "/opt/homebrew/opt/llvm/clang++"

# preferred editor
set -gx EDITOR 'nvim'

set -gx PATH "$HOME/.local/bin" $PATH
set -gx PATH $PATH "$HOME/go/bin"
set -gx https_proxy "http://127.0.0.1:7897"
set -gx http_proxy "http://127.0.0.1:7897"
set -gx all_proxy "socks5://127.0.0.1:7897"

# @note: rustup mirror site
set -gx RUSTUP_DIST_SERVER "https://rsproxy.cn"
set -gx RUSTUP_UPDATE_ROOT "https://rsproxy.cn/rustup"

# bat theme
set -gx BAT_THEME OneHalfDark

set -gx PATH $PATH "$HOME/.nvm/versions/node/v23.1.0/bin"
