# @note: we use `nvm use <node version>` to activate a specific node version. 
# Add default node to path
export PATH="$PATH:$HOME/.nvm/versions/node/v23.1.0/bin"

# @note: Homebrew prefix will be export 
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
