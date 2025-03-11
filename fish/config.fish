set -gx DOT_FILE_DIR "$HOME/dotfiles"
fish_vi_key_bindings

zoxide init fish | source
starship init fish | source
uv generate-shell-completion fish | source
micromamba shell hook --shell fish | source

function fish_greeting
    fastfetch --logo none
end

if status is-interactive
end

