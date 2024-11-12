autoload -Uz compinit && compinit
eval "$(starship init zsh)"

# @note: Now We can use <C-t> to match dirs better
# <Alt-c> match file better
eval "$(fzf --zsh)"

# the z jump tool
eval "$(zoxide init zsh)"


# export "ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters"
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# vi mod 
set -o vi 

# homebrew for zsh using ustc mirror
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"

# for llvm
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib/unwind -lunwind" 
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# @note: DOT_FILE_DIR
export DOT_FILE_DIR="${HOME}/dotfiles"

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
export PATH="$HOME/.local/bin:$PATH"
export https_proxy="http://127.0.0.1:7897"
export http_proxy="http://127.0.0.1:7897"
export all_proxy="socks5://127.0.0.1:7897"

# @note: rustup mirror site
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# Add user py env
export PATH="$PATH:$HOME/usr_pyenv/bin/"
source "$HOME/usr_pyenv/bin/activate"
# completion for pipx
eval "$(register-python-argcomplete pipx)"

alias ls="eza --icons=always --no-user -ag"
alias ll="ls -lah"
alias l="ls -lah"
alias cat="bat -p"
alias show-pic="wezterm imgcat"
alias tree="eza --tree --ignore-glob .git"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gst="git status"
alias vide="neovide"

# ctrl+/ to accept autosuggest
bindkey "^_" autosuggest-accept

# bat theme 
export BAT_THEME=OneHalfDark

# @note:deprecated,because we use `yazi` now
# export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
#
# _fzf_compgen_path(){
#     fd --hidden --exclude .git . "$1"
# }
#
# _fzf_compgen_dir(){
#     fd --type=d --hidden --exclude .git . "$1"
# }
#
# export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
# export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
#
# _fzf_comprun(){
#     local command=$1
#     shift
#
#     case "$command" in 
#         cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
#         export|unset) fzf --preview "eval 'echo \$' {}"      "$@" ;;
#         *) fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "$@" ;;
#     esac
# }


# yazi file manager
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# @note: we use `nvm use <node version>` to activate a specific node version. 
# Add default node to path
export PATH="$PATH:$HOME/.nvm/versions/node/v23.1.0/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
