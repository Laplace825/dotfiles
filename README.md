# Dotfiles (macOS Branch)

## Installation

This configuration may later be written as a simple script, but manual configuration is still required for now.

**Note**: The following command will clone the repository to `${HOME}/dotfiles`.

```bash
git clone -b macos --depth 1 https://github.com/Laplace825/dotfiles.git ~/dotfiles/
```

I have exported some environment variables in the `.zshrc` file. You can choose to configure zsh first or export them in bash first:

```bash
export DOT_FILE_DIR="${HOME}/dotfiles"
```

*Because I have immigrated to fish, so zshrc just exce fish*, you will find like `set -gx $DOT_FILE_DIR ~/dotfiles` in config.fish.

## CLI Tools

Common tools I use. Some of are optional to choose but those I do not comment are highly recommended to install.

```bash
brew install \
    neovim \
    eza \
    fastfetch \
    fzf \
    fd \
    bat \
    lazygit \
    zoxide \
    starship \
    yazi \
    zsh-autosuggestions \
    zsh-syntax-highlighting
# brew uv micromamba zed (optinal)
```

## fish (optinal)

If you want to use fish also, you could install the [fisher](https://github.com/jorgebucaran/fisher)  to manage fish's
plugins.

Use this below to link the config file to your fish.

```bash
ln -s "$DOT_FILE_DIR/fish" ~/.config/fish
```

Because I use micromamba, uv, starship, fastfetch and zoxide, their fish integral
has already written in `config.fish`. You can comment which you don't need.

### catppuccin (optional)

I really like Catppuccin Theme. So I use it in my fish also with `Catppuccin Mocha`.

```bash
fisher install catppuccin/fish

fish_config theme save "Catppuccin Mocha"
```

### about nvm 

I must use node and nvm. And I currently use `node v23.1.0`, nvm officially does not provide
fish integral, so I use `fisher` to install [nvm.fish](https://github.com/jorgebucaran/nvm.fish) and 'export' node to `$PATH`
in `export.fish`. *You will need to change the node's PATH if you use a different node version*.

## Zshell

The starship initialization has already been added to the zshrc file,
along with plugins like zsh-autosuggestions and zsh-syntax-highlighting.

## AstroNvim
```bash
# Backup existing nvim config (optional but recommended)
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# Initialize AstroNvim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Run nvim to perform initial setup
nvim

# Symlink custom configurations (replace <Which> with actual paths)
ln -s ${DOT_FILE_DIR}/AstroNvim/lua/<Which> ~/.config/nvim/lua/<Which>
```

## Neovide Installation

```bash
brew install neovide
```

## Zshrc Customization

Optional: Use the repo's .zshrc directly or add this alias:

```bash
alias vide="neovide"
```

## Kitty Terminal

Kitty 0.37+ supports cursor animations similar to Neovide. Includes macOS-specific key mappings:

```bash
ln -s ${DOT_FILE_DIR}/kitty ~/.config/kitty
```

## WezTerm + Starship

```bash
# Symlink WezTerm config
ln -s ${DOT_FILE_DIR}/wezterm ~/.config/wezterm

ln -s ${DOT_FILE_DIR}/starship/starship.toml.default ~/.config/starship.toml
```

## Yazi

[Yazi](https://github.com/sxyazi/yazi) is a great TUI software act as a file manager written in Rust.
The alias `y` and config are already integrated into fish and zshrc in these dotfiles.

## Clang-Format (optional)

```bash
ln -s ${DOT_FILE_DIR}/.clang-format ~/.clang-format
```

## Zed Editor (optional)

Lightweight high-performance editor with minimal configuration:

```bash
ln -s ${DOT_FILE_DIR}/zed/settings.json ~/.config/zed/settings.json
ln -s ${DOT_FILE_DIR}/zed/keymap.json ~/.config/zed/keymap.json
ln -s ${DOT_FILE_DIR}/zed/tasks.json ~/.config/zed/tasks.json
```

## TODOS

- Create an installation script for these dotfiles
