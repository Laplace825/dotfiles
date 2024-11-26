# My dotfile

## about

目前有两个分支，`main` 和 `macos`，前者适用于大多数 `unix/Linux` 系统，后者针对`macos`做了新的
配置项和配置软件，不应该将两个分支合并。

## install 

以后可能会写成一个简单的脚本，不过选择仍然需要手动配置。

**请注意**，下面会将仓库clone到`${HOME}/.dotfile`中。

```bash
git clone --depth 1 https://github.com/Laplace825/dotfiles.git ~/.dotfile/
```

一些个人软件配置, **由于个人已经转向了 Arch Linux, 部分配置可能只在 Arch 系上更为方便**
同时，我在`.zshrc`文件中export了一些环境变量。你可以选择先配置zsh，或者先在bash中export。

```bash
export DOT_FILE_DIR="${HOME}/.dotfile"
```

## Hyprland
这里是直接使用[JaKooLit/Arch-Hyprland](https://github.com/JaKooLit/Arch-Hyprland)安装脚本，
需要尽可能保持干净的系统环境再进行安装。

+ `waybar`配置修改

添加了部分 module

## Zshell

+ 安装`zsh`
```bash
## debian like
# 更新软件源
sudo apt update && sudo apt upgrade -y
# 安装 zsh git curl
sudo apt install zsh git
curl -y

## arch like
sudo pacman -Syu
sudo pacman -Sy git zsh
```

+ 安装`oh-my-zsh`

```bash
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# 国内源
sh -c "$(wget -O- https://gitee.com/pocmon/ohmyzsh/raw/master/tools/install.sh)"
```

+ 安装`powerlevel10k`

```bash
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 使用自定义的配置
cp ${DOT_FILE_DIR}/p10kconf/.p10k.zsh ~/.p10k.zsh
```

+ 安装CLI工具

这里是我安装的一些常用工具

```bash
## arch like
sudo pacman -Sy eza fastfetch fzf fd bat glow lazygit
paru -S yazi-git zsh-autosuggestions zsh-syntax-highlighting
```

+ 配置，以`waybar`为例子

大部分配置文件默认在`${HOME}/.config` 目录下的，一般建立文件链接就行。
部分文件可能因为有独立的`plugins`(例如yazi)，所以对yazi只进行特定文件做链接。

```bash
ln -s ${DOT_FILE_DIR}/waybar ~/.config/waybar
```

## Lunarvim Or AstroNvim

官网地址[lunarvim](https://www.lunarvim.org/zh-Hans/docs/installation)

+ 安装`lunarvim`

建议还是使用官网的安装脚本，目前打算移步使用 `AstroNvim`。
目前`lunarvim`的主要维护者转向了`AstroNvim`，可能较长一段时间都不会有大版本更迭。 

```bash
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
```

+ 安装 `AstroNvim`

由于 `lvim` 本身是用`local/bin/lvim` 脚本启动，并且也能发现其配置文件一般是
在 `lunarvim` or `lvim` 文件夹，不影响 `nvim`，所以两个 distro 不会冲突。

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

### 基于`Rust`

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

### 基于`snap`

```bash
sudo apt install -y curl \
    gnupg ca-certificates git \
    gcc-multilib g++-multilib cmake libssl-dev pkg-config \
    libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
    libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev \
    libxcursor-dev
```

### archlinux 

```bash
sudo pacmans -S neovide
```

### `.zshrc`添加

```bash
# 默认启用 AstroNvim 配置
alias vide="neovide"
# 启用 lunarvim 配置
alias lvide="neovide --neovim-bin ${HOME}/.local/bin/lvim"
```

## kitty

使用的默认模拟终端为`kitty`，也保留了 Konsole，不过一般是用的 kitty。
What the most amazing，在0.37版本`kitty`引入了类似neovide的光标动画，虽然
没有那么多特效，但是shell体验简直***amazing***。

```bash
ln -s ${DOT_FILE_DIR}/kitty  ~/.config/kitty
```

## clang-format

为了方便我直接丢在`${HOME}` 下，所以直接做的链接。

```bash
ln -s ${DOT_FILE_DIR}/.clang-format ~/.clang-format
```


## TODOS

+ 完成该 dotfile 的 install 脚本.
