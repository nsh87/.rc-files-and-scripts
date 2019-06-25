# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Set any aliases
alias gamsg='git add --all; git commit -m '
alias path='. getdirfilepath.sh'
alias ll='ls -alh'
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
plugins=(git virtualenvwrapper python autojump autopep8 brew dirhistory fabric jstontools pip urltools vagrant history vi-mode per-directory-history)

# Autojump plugin
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && \
    . $(brew --prefix)/etc/profile.d/autojump.sh

source $ZSH/oh-my-zsh.sh

# PATH configuration
DEFAULT=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
CUSTOM_SCRIPTS=$(python -c "import os; zshrc_path=os.path.realpath('${(%):-%x}'); print zshrc_path[:-6]+'scripts'")
export PATH=$DEFAULT:$CUSTOM_SCRIPTS

# Travis-CI
[ -f /Users/Nikhil/.travis/travis.sh ] && source /Users/Nikhil/.travis/travis.sh

# Set VAGRANT_HOME on Mac Pro to be on your external drive
if hostname | grep -q "NSMP"
then
    export VAGRANT_HOME=/Volumes/Raid/.vagrant.d
fi
