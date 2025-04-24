set -gx DOT_FILE_DIR "$HOME/dotfiles"
fish_vi_key_bindings

thefuck --alias | source
zoxide init fish | source
starship init fish | source
uv generate-shell-completion fish | source

set -gx MAMBA_EXE "$HOMEBREW_PREFIX/opt/micromamba/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "$HOME/mamba"
eval "$(micromamba shell hook --shell fish)"

function fish_greeting
    fastfetch --logo none
end

if status is-interactive
end

