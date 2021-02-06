# vim:foldmethod=marker

# aliases {{{
# ls
alias 'ls=exa'
alias 'la=ls -la'
alias 'll=ls -lh'
# dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
# configuration
alias 'cfg:nvim=nvim ~/.config/nvim/'
alias 'cfg:vi=cfg:nvim'
alias 'cfg:vim=cfg:nvim'
alias 'cfg:coc=nvim ~/.config/nvim/coc-settings.json'
alias 'cfg:kitty=nvim ~/.config/kitty/kitty.conf'
alias 'cfg:zsh=nvim ~/.zshrc'
alias 'cfg:profile=nvim ~/.profile'
# update
alias 'update:zsh=zplugin update --all'
alias 'update:nvim=brew upgrade --fetch-HEAD neovim'
alias 'update:vi=update:nvim'
alias 'update:vim=update:nvim'
# cd
alias 'cd:vi=cd ~/.config/nvim'
alias 'cd:vim=cd ~/.config/nvim'
alias 'cd:nvim=cd ~/.config/nvim'
alias 'cd:repos=cd ~/repos'
# zsh
alias 'zsh:reload=source ~/.zshrc'
alias 'zsh:cfg=cfg:zsh'
alias 'zsh:update=update:zsh'
# nvim
alias 'vi=nvim'
alias 'vim=nvim'
alias 'vimdiff=nvim -d'
alias 'vi:cfg=cfg:nvim'
alias 'vim:cfg=cfg:nvim'
alias 'nvim:config=cfg:nvim'
alias 'vi:update=update:nvim'
alias 'vim:update=update:nvim'
alias 'nvim:update=update:nvim'
# }}}

# history {{{
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
# }}}

# zinit {{{
### Added by zinit's installer
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit's installer chunk
# }}}

# annexes {{{
zinit light-mode compile"handler" for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node \
    zinit-zsh/z-a-submods
# }}}

# plugins {{{
zinit lucid load pick"/dev/null" multisrc"{async,pure}.zsh" for \
    sindresorhus/pure

zinit wait lucid light-mode for \
      Aloxaf/fzf-tab \
      rupa/z \
      lukechilds/zsh-better-npm-completion \
  atload"zpcdreplay" atclone'./zplug.zsh' \
      g-plane/zsh-yarn-autocompletions \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions

# Recommended Be Loaded Last.
zinit ice wait blockf lucid atpull'zinit creinstall -q .'
zinit load zsh-users/zsh-completions

autoload -Uz compinit
compinit
zinit cdreplay -q
# }}}

# zstyle {{{
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'cat $realpath'
# }}}

# fzf {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

# fnm {{{
eval "`fnm env --multi --shell=zsh --use-on-cd`"
# }}}

# profile {{{
[ -f ~/.profile ] && source ~/.profile
# }}}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:./node_modules/.bin:./vendor/bin:./bin:/.fnm/current/bin"
