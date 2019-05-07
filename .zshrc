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
alias 'la=ls -la'
alias 'll=ls -lh'
alias 'vim=nvim'
alias 'vimdiff=nvim -d'
alias 'cd:repos=cd ~/repos'
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

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
source '/Users/apzelos/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

SPACESHIP_CHAR_SYMBOL='❯ '
SPACESHIP_GIT_SYMBOL=''
SPACESHIP_DIR_TRUNC_PREFIX='.../'
SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  user          # Username section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  xcode         # Xcode section
  aws           # Amazon Web Services section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
zplugin light 'denysdovhan/spaceship-prompt'

zplugin light zsh-users/zsh-autosuggestions

zplugin light zdharma/fast-syntax-highlighting

export NVM_LAZY_LOAD=true
zplugin light lukechilds/zsh-nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# =====================
# Exports
# =====================
export PATH="$PATH:/usr/local/opt/mongodb@3.6/bin/"
