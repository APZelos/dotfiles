## Requirements
##### macOS
- [Homebrew](https://brew.sh)

#### Git
##### macOS
Install with Homebrew:
```sh
brew install git
```

## ZSH
##### macOS
Install with Homebrew:
```sh
brew install zsh
```
To make ZSH default shell:
1. Go to System Preferences
2. Click on "Users & Groups"
3. Click the lock to make changes.
4. Right click the current user -> Advanced options
5. Open a terminal and copy the output of `which zsh` command
6. Paste the output to the `Login shell` field

### [ZPlugin](https://github.com/zdharma/zplugin)
Follow the instructions [here](https://github.com/zdharma/zplugin/blob/master/doc/INSTALLATION.adoc) to install **ZPlugin**.

### Node
Install node with nvm *(is installed from [zsh-nvm](https://github.com/lukechilds/zsh-nvm) plugin)*:
```sh
nvm install # 'node' for latest or 'x.x.x' for specific version
```

## [neovim](https://neovim.io)
##### macOS
Install with Homebrew:
```sh
brew install neovim
```

### [coc.nvim](https://github.com/neoclide/coc.nvim)

#### yarn
You must install yarn before running `:PlugInstall` otherwise coc.nvim installation will fail.
##### macOS
Install with Homebrew
```sh
brew install yarn
```

### [vim-plug](https://github.com/junegunn/vim-plug)
Follow the instructions [here](https://github.com/junegunn/vim-plug#neovim) to install **vim-plug**.

Open neovim and run `:PlugInstall` to install plugins.

To install coc.nvim extensions open neovim and run:
```
:CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css
```
