export FPATH="${HOME}/.zfunc:${FPATH}"
export FPATH="${HOME}/.docker/completions:${FPATH}"
autoload -Uz compinit && compinit

eval "$(starship init zsh)"

# the z jump tool
eval "$(zoxide init zsh)"

# export "ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters"
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# @note: DOT_FILE_DIR
export DOT_FILE_DIR="${HOME}/dotfiles"

source "${DOT_FILE_DIR}/ZShell/export.sh"

# vi mod 
set -o vi 

source "${DOT_FILE_DIR}/ZShell/alias.sh"

# ctrl+/ to accept autosuggest
bindkey "^_" autosuggest-accept

set thrid_partys=$(/bin/ls ${DOT_FILE_DIR}/ZShell/thrid-party)
for thrid_party in ${thrid_partys}; do
		source "${DOT_FILE_DIR}/ZShell/thrid-party/${thrid_party}"
done
unset thrid_partys

set my_func=$(/bin/ls "${DOT_FILE_DIR}/ZShell/my_func")
for func in ${my_func}; do
		source "${DOT_FILE_DIR}/ZShell/my_func/${func}"
done
unset my_func
