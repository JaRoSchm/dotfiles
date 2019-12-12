# Path to zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# add z command
source $(brew --prefix)/etc/profile.d/z.sh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Activate Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew tmux python)

# activate vim-mode
# bindkey -v

# Updates editor information when the keymap changes.
# function zle-keymap-select() {
#   zle reset-prompt
#   zle -R
# }

# zle -N zle-keymap-select

# function vi_mode_prompt_info() {
#   echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
# }

# define right prompt, regardless of whether the theme defined it
# RPS1='$(vi_mode_prompt_info)'
# RPS2=$RPS1

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
# export KEYTIMEOUT=1

# Better searching in command mode
# bindkey -M vicmd '?' history-incremental-search-backward
# bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
# bindkey "^[OA" up-line-or-beginning-search
# bindkey "^[OB" down-line-or-beginning-search
# bindkey -M vicmd "k" up-line-or-beginning-search
# bindkey -M vicmd "j" down-line-or-beginning-search

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias condaupdate="conda update --all --yes; conda clean --all --yes;"
alias brewupdate="brew update; brew upgrade; brew cask outdated --greedy; brew cask upgrade; brew cleanup"
alias pyupdate="poetry self update; pipx upgrade-all; pip install --upgrade --user pipx"
alias cat="bat"
export BAT_THEME="GitHub"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH="/usr/local/sbin:$PATH"

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##############################
# For Julia:
export JULIA_NUM_THREADS=4

##############################
# For CPG:

export REPOSITORIES=$HOME/Devel/Repositories
export PYTHONPATH=${REPOSITORIES}//:${PYTHONPATH}
export PATH=${REPOSITORIES}/CPG/bin:$PATH

alias pullall="find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;"
alias iterator="conda activate cpg; pythonw ${REPOSITORIES}/iterator/iterator "
alias explorator="conda activate cpg; CC=gcc-9 python ${REPOSITORIES}/explorator/explorator "

export BIBINPUTS=${REPOSITORIES}/Bibtex:${BIBINPUTS}
export BIBINPUTS=${REPOSITORIES}/CPG/other/latex_and_bibtex/bibstyles:${BIBINPUTS}
export BSTINPUTS=$REPOSITORIES/Bibtex/bibstyles:${REPOSITORIES}/CPG/other/latex_and_bibtex/bibstyles:${BSTINPUTS}

export TEXINPUTS=${REPOSITORIES}/CPG/other/latex_and_bibtex/styles:${TEXINPUTS}

# This directory not necessarily exists!!!
export ARTICLE_STORAGE=~/Downloads
# If local user and the one one ptpcp4 have different logins, you can
# use this variable to adjust it.
export ARTICLE_STORAGE_USER="jschmidt"

# Set the following variables to a different viewer if necessary:
PDF_VIEWER_FOR_GET_ARTICLE="open -a Preview"
PDF_VIEWER_FOR_CHECK_BIBTEX="open -a Preview"

# and add the following before 'compinit'
# (for the TAB completion of the Iterator):
fpath=(${REPOSITORIES}/iterator/util/shutils $fpath)

# Try completion for explorator:
# add custom completion scripts
fpath=(~/.zsh/completion $fpath)
fpath=(~/Devel/Repositories/explorator/util/shutils $fpath)

# export CPG_ANACONDA_PATH=/scratch/$USER/CPG_anaconda/
# For a different destination (e.g. for your laptop not having scratch) use:
export CPG_ANACONDA_PATH=~/miniconda3/
# Make conda available:
# . ${CPG_ANACONDA_PATH}/etc/profile.d/conda.sh
# Activate:
# conda activate CPG_stable
alias cpg="conda activate CPG_stable"

# Explorator:
export ETS_TOOLKIT="qt4"
# get rid of error "double free or corruption (!prev)"
export LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4"

export PATH="/usr/local/opt/llvm/bin:$PATH"
#############################################

# use pipx
export PATH=~/.local/bin:$PATH

# use poetry
export PATH=~/.poetry/bin:$PATH

compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/janrobertschmidt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/janrobertschmidt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/janrobertschmidt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/janrobertschmidt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init - zsh)"
 eval "$(pyenv virtualenv-init - zsh)"
fi

# Created by `userpath` on 2019-11-27 12:32:52
export PATH="$PATH:/Users/janrobertschmidt/.local/bin"
