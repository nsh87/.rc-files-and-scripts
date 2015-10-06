# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Set any aliases
alias gamsg='git add --all; git commit -m '
alias path='. getdirfilepath.sh'
alias vls='ls -al'
alias startpostgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppostgres='pg_ctl -D /usr/local/var/postgres stop'
alias zshrc='vi ~/.zshrc'
alias vimrc='vi ~/.vimrc'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=28

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins ar in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git virtualenvwrapper python autojump autopep8 brew dirhistory fabric jstontools pip urltools vagrant history vi-mode)

# Autojump plugin
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && \
    . $(brew --prefix)/etc/profile.d/autojump.sh

source $ZSH/oh-my-zsh.sh

# PATH configuration
DEFAULT=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin
GIT=/usr/local/git/bin
CANOPY=$HOME/Library/Enthought/Canopy_64bit/User/bin
MONGODB=/usr/local/mongodb/bin
CUSTOM_SCRIPTS=$(python -c "import os; zshrc_path=os.path.realpath('${(%):-%x}'); print zshrc_path[:-6]+'scripts'")
# PATH with Entought Canopy
export PATH=$CANOPY:$DEFAULT:$GIT:$MONGODB:$CUSTOM_SCRIPTS
# PATH without Entought Canopy
# export PATH=$DEFAULT:$GIT:$MONGODB:$CUSTOM_SCRIPTS

# Travis-CI
[ -f /Users/Nikhil/.travis/travis.sh ] && source /Users/Nikhil/.travis/travis.sh
