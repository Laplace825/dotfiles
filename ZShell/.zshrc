export FPATH="${HOME}/.zfunc:${FPATH}"
autoload -Uz compinit && compinit
# @note: DOT_FILE_DIR
export DOT_FILE_DIR="${HOME}/dotfiles"

ZSHELL_ROOT_DIR=${DOT_FILE_DIR}/ZShell

source "${ZSHELL_ROOT_DIR}/export.zsh"

exec fish

# eval "$(starship init zsh)"
#
# # the z jump tool
# eval "$(zoxide init zsh)"
#
# # export "ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters"
# source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
# source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
#
# export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
#
# # vi mod
# set -o vi
#
# source "${ZSHELL_ROOT_DIR}/alias.zsh"
#
# # ctrl+/ to accept autosuggest
# bindkey "^_" autosuggest-accept
#
# function _source_dir() {
# 	DIR="${ZSHELL_ROOT_DIR}/$1";if [ -d "$DIR" ]; then
# 		for zf in "$DIR"/*.zsh; do
# 			[ -f "$zf" ] && source "$zf"
# 		done
# 	fi
# }
#
# _source_dir 'thrid-party'
# _source_dir 'my_func'
