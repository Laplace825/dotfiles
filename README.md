# My dotfile The MacOS Branch

## install 

以后可能会写成一个简单的脚本，不过选择仍然需要手动配置。

**请注意**，下面会将仓库clone到`${HOME}/dotfiles`中。

```bash
git clone -b macos --depth 1 https://github.com/Laplace825/dotfiles.git ~/dotfiles/
```

我在`.zshrc`文件中export了一些环境变量。你可以选择先配置zsh，或者先在bash中export。

```bash
export DOT_FILE_DIR="${HOME}/dotfiles"
```


## Zshell

+ 安装`oh-my-zsh`(optional)

可用选择使用`omz`的配置，或者使用`starship`

```bash
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# 国内源
sh -c "$(wget -O- https://gitee.com/pocmon/ohmyzsh/raw/master/tools/install.sh)"
```

+ 安装`starship`(optional)

<!-- TODO: -->

+ 安装CLI工具

这里是我安装的一些常用工具

```bash
brew install neovim eza fastfetch fzf fd bat glow lazygit
brew install yazi zsh-autosuggestions zsh-syntax-highlighting
```

## AstroNvim

```bash
#  将原来的 nvim 配置备份(optional but Recommand)
mv ~/.config/nvim ~/.config/nvim.bak

mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# 启动进行一些初始化工作
nvim

# 将 ${DOT_FILE_DIR}/AstroNvim/lua 内容按需链接 ~/.config/nvim/lua/ 下
ln -s ${DOT_FILE_DIR}/AstroNvim/lua/<Which> ~/.config/nvim/lua/<Which>

```

## 安装`neovide`

### 基于`brew`

```bash
brew install neovide
```

### 基于`Cargo`

+ 安装`Rust`

```bash
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh
```

+ 设置`crate.io`镜像[RsProxy](https://rsproxy.cn/)

`${DOT_FILE_DIR}/cargo` 下只存放了该配置文件

```bash
# in ~/.cargo/config.toml
[source.crates-io]
replace-with = 'rsproxy-sparse'
[source.rsproxy]
registry = "https://rsproxy.cn/crates.io-index"
[source.rsproxy-sparse]
registry = "sparse+https://rsproxy.cn/index/"
[registries.rsproxy]
index = "https://rsproxy.cn/crates.io-index"
[net]
git-fetch-with-cli = true
```

+ 源码编译安装`neovide`

```bash
cargo install --git https://github.com/neovide/neovide
```


### `.zshrc`添加

这里也可以不进行添加，直接使用repo的`.zshrc`也行，但是可能你想自定义。

```bash
# 默认启用 AstroNvim 配置
alias vide="neovide"
```

## kitty

What the most amazing，在0.37版本`kitty`引入了类似neovide的光标动画，虽然
没有那么多特效，但是shell体验简直***amazing***。

由于macos的`option`键和`Alt`键需要映射一下，这里的配置文件额外加入了macos相关。

```bash
ln -s ${DOT_FILE_DIR}/kitty  ~/.config/kitty
```

## WezTerm with Starship

<!-- TODO: -->

## clang-format

为了方便我直接丢在`${HOME}` 下，所以直接做的链接。

```bash
ln -s ${DOT_FILE_DIR}/.clang-format ~/.clang-format
```

## TODOS

+ 完成该 dotfile 的 install 脚本.
