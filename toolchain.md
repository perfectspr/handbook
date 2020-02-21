# 基础配置

拿到开发机之后，需要做一些基础配置。

## 设置代理

如果是个人电脑，请跳过这节。

公司为了安全审计和节省带宽，都会设置HTTP代理服务器，员工访问外部网站都需要走这个服务器。

Mac和Linux下一般需要在shell的启动脚本中设置HTTP_PROXY和HTTPS_PROXY环境变量。

<!-- tabs:start -->
#### ** Mac/Linux **
打开Terminal，如果用bash，编辑**~/.bash_profile**文件。如果用zsh/oh-my-zsh，编辑**~/.zshrc文件**。加入以下代码，
将example.com:3000替换成公司代理服务器地址和端口。
```bash
export http_proxy=http://example.com:3000
export https_proxy=$http_proxy
export HTTPS_PROXY=$http_proxy
export HTTP_PROXY=$http_proxy
export no_proxy=localhost,127.0.0.1,.example.com
export NO_PROXY=$no_proxy
```
然后重启Terminal，或者输入
```bash
# for bash
. ~/.bash_profile
# for zsh
. ~/.zshrc
```
#### ** Windows **

点击Windowns按钮,输入**env**, 点击“Edit environment variables for your account”.

![windows user env](https://photo-1300482669.cos.ap-shanghai.myqcloud.com/2020/02/windows_user_env.png)

添加http_proxy,https_proxy和no_proxy环境变量:
![Windows Env](https://photo-1300482669.cos.ap-shanghai.myqcloud.com/2020/02/windows_env.png)

<!-- tabs:end -->


## 包管理器

主流操作系统都有官方或第三方包管理器，可以非常方便的安装常用软件。
<!-- tabs:start -->
#### ** MacOS **
Mac 下主流包管理器是[Homebrew](https://brew.sh/).  打开Terminal, 安装homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
配置homebew国内源, 这里用的是[清华源](https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/)
```bash
git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
brew update
```
#### ** Ubuntu  **
Ubuntu用apt命令管理安装包.  打开Terminal更改apt源.

```bash
sudo vim /etc/apt/sources.list
```
将source.list文件内容替换成下面的
```text
deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
```
更新
```bash
sudo apt-get update
```

#### ** Windows  **
安装[Chocolatey](https://chocolatey.org/)。 如果你有Administor权限，请用Adminstrator打开powershell，执行命令:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
如果你没有Administrator权限，需要
- 保存下面的powershell script 到文件: ChocolateyInstallNonAdmin.ps1.
- 更改安装目录
- 打开PowerShell.exe
- 运行 Set-ExecutionPolicy Bypass -Scope Process -Force;
- 运行 .\ChocolateyInstallNonAdmin.ps1.

```powershell
# Set directory for installation - Chocolatey does not lock
# down the directory if not the default
$InstallDir='C:\ProgramData\chocoportable'
$env:ChocolateyInstall="$InstallDir"
# If your PowerShell Execution policy is restrictive, you may
# not be able to get around that. Try setting your session to
# Bypass.
Set-ExecutionPolicy Bypass -Scope Process -Force;

# All install options - offline, proxy, etc at
# https://chocolatey.org/install
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

<!-- tabs:end -->

## 通用开发工具

除了Java开发，一般都会选择Visual Studio Code作为主要开发平台。

如果你喜欢命令行工具， Mac/Linux下推荐用以下工具链
- Terminal/iterm2(Mac)
- tmux
- oh-my-zsh
- Vim + coc.nvim

安装工具链
<!-- tabs:start -->
#### ** Mac **
```bash
brew install tmux item2 vim zsh
# 安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
如何配置这些工具，请参考[https://github.com/perfectspr/mac_dotfiles](https://github.com/perfectspr/mac_dotfiles)

#### ** Ubuntu **
```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim tmux zsh
# 安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
#### ** Windows **
不想折腾的话用Visual Studio Code.  想折腾的话可以用:
- ConEmu
- PowerShell
- Vim + coc.nvim
```powershell
choco install ConEmu Vim -y
```
<!-- tabs:end -->


## Mac/Linux 常用命令行工具
- fzf      查找文件 历史命令查询 快速进入目录 文件预览 替代find
- ripgrep  速度最快、理解git 的全文搜索利器, 替代grep
- autojump 快速跳转目录
- aria2c   全能下载工具，HTTP 下载和 BT 下载都有，性能也相当不错，速度不比迅雷慢

```bash
# For Mac
brew install fzf ripgrep autojump aria2
# For Ubuntu
sudo apt install fzf ripgrep autojump aria2
```

## Visual Studio Code 插件
- Path Intellisense
- Visual Studio IntelliCode
- EditorConfig for VS code
- Javascript (es6) code snippets
- vscode-icon
- ESlint
- Test Explorer UI
- GitLen
- Vim
- Docker
- DotEnv
- Project Manager
- Remote-SSH

## 浏览器
全平台推荐Google Chrome 或Firefox。 两者都可以安装Vim插件。

## 笔记
Mac和Windows下推荐OneNote。
