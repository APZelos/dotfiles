# =====================
#  ZSH configuration
# 
#  Table of Contents
#    General
#    Aliases
#    Language
#    History
#    Plugins
#    Exports
# =====================

# =====================
#  General
# =====================
DEFAULT_USER=apzelos

# =====================
#  Aliases
# =====================
# ls
alias 'la=ls -la'
alias 'll=ls -lh'
# dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
# configuration
alias 'cfg:vi=nvim ~/.config/nvim/'
alias 'cfg:vim=nvim ~/.config/nvim/'
alias 'cfg:nvim=nvim ~/.config/nvim/'
alias 'cfg:coc=nvim ~/.config/nvim/coc-settings.json'
alias 'cfg:kitty=nvim ~/.config/kitty/kitty.conf'
alias 'cfg:zsh=nvim ~/.zshrc'
alias 'cfg:profile=nvim ~/.profile'
# cd
alias 'cd:vi=cd ~/.config/nvim'
alias 'cd:vim=cd ~/.config/nvim'
alias 'cd:nvim=cd ~/.config/nvim'
alias 'cd:repos=cd ~/repos'
# zsh
alias 'zsh:reload=source ~/.zshrc'
alias 'zsh:cfg=nvim ~/.zshrc'
alias 'zsh:update=zplugin update --all'
# nvim
alias 'vi=nvim'
alias 'vim=nvim'
alias 'vimdiff=nvim -d'
alias 'vi:cfg=nvim ~/.config/nvim/init.vim'
alias 'vim:cfg=nvim ~/.config/nvim/init.vim'
alias 'nvim:config=nvim ~/.config/nvim/init.vim'
# git
alias glog="git log --pretty=oneline --abbrev-commit | fzf --preview 'echo {} | cut -f 1 -d \" \" | xargs git show --color=always'"
alias gdiff="git diff --name-only | fzf --preview 'echo {} | xargs git diff --color=always | diff-so-fancy | less --tabs=4 -RFX'"

# =====================
#  Language
# =====================
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

# =====================
#  History
# =====================
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# =====================
#  Plugins
# =====================
### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

zplugin light zsh-users/zsh-autosuggestions

zplugin light zdharma/fast-syntax-highlighting

export NVM_LAZY_LOAD=true
zplugin light lukechilds/zsh-nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -U --hidden --path-to-ignore ~/.ignore -g ""'
export FZF_CTRL_T_COMMAND='ag -U --hidden --path-to-ignore ~/.ignore -g ""'

# =====================
#  FNM (nodejs version managment)
# =====================
eval "`fnm env --multi --shell=zsh --use-on-cd`"

# =====================
#  Files to load
# =====================
[ -f ~/.profile ] && source ~/.profile

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:./node_modules/.bin:./vendor/bin:./bin:/.fnm/current/bin"
