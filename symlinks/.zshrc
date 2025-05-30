# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# add z command
# source $(brew --prefix)/etc/profile.d/z.sh

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-vi-mode python pip)

# Activate Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias condaupdate="conda update --all --yes; conda clean --all --yes;"
alias brewupdate="brew update; brew upgrade; brew cask outdated --greedy; brew cask upgrade; brew cleanup"
alias pyupdate="poetry self update; pipx upgrade-all; pip install --upgrade --user pipx"
alias pullall="find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;"
# alias cat="bat"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# User configuration

export PATH="/usr/local/sbin:$PATH"

alias vim=nvim

##############################
# For bat:

export BAT_THEME="GitHub"

##############################
# For Fzf:

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# load fzf after zsh-vi-mode
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

##############################
# For Julia:
export JULIA_NUM_THREADS=4

##############################
# For CPG:

export REPOSITORIES=$HOME/Devel/Repositories
export PYTHONPATH=${REPOSITORIES}//:${PYTHONPATH}
export PATH=${REPOSITORIES}/CPG/bin:$PATH
export EDITOR=vim

alias iterator="cpg; CC=gcc-14 python ${REPOSITORIES}/iterator/iterator "
alias explorator="cpg; CC=gcc-14 python ${REPOSITORIES}/explorator/explorator "
alias cdr="cd ~/Devel/Repositories/"

export BIBINPUTS=${REPOSITORIES}/Bibtex:${BIBINPUTS}
export BIBINPUTS=${REPOSITORIES}/CPG/other/latex_and_bibtex/bibstyles:${BIBINPUTS}
export BSTINPUTS=$REPOSITORIES/Bibtex/bibstyles:${REPOSITORIES}/CPG/other/latex_and_bibtex/bibstyles:${BSTINPUTS}
export TEXINPUTS=${REPOSITORIES}/CPG/other/latex_and_bibtex/styles:${TEXINPUTS}

export ARTICLE_STORAGE=~/Devel/ArticleStorage
# If local user and the one one ptpcp4 have different logins, you can
# use this variable to adjust it.
export ARTICLE_STORAGE_USER="jschmidt"

# Set the following variables to a different viewer if necessary:
export PDF_VIEWER_FOR_GET_ARTICLE="open -a Preview"
export PDF_VIEWER_FOR_CHECK_BIBTEX="open -a Preview"

# and add the following before 'compinit'
# (for the TAB completion of the Iterator):
fpath=(${REPOSITORIES}/iterator/util/shutils $fpath)

# Try completion for explorator:
fpath=(~/Devel/Repositories/explorator/util/shutils $fpath)

# For a different destination (e.g. for your laptop not having scratch) use:
export CPG_ANACONDA_PATH=~/miniconda3/
export SCRATCH=~/scratch/

# Activate:
# conda activate CPG_stable
# alias cpg="mamba activate CPG_stable"
alias cpg="pixi_activate CPG_stable"

# Explorator:
export ETS_TOOLKIT="qt"
export ETS_QT4_IMPORTS=1
export QT_API="pyside6"
# get rid of error "double free or corruption (!prev)"
export LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4"

export PATH="/usr/local/opt/llvm/bin:$PATH"

compinit

##############################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `userpath` on 2020-12-11 14:09:31
export PATH="$PATH:/Users/janrobertschmidt/.local/bi"

# Created by `userpath` on 2020-12-11 14:10:07
export PATH="$PATH:/Users/janrobertschmidt/.local/bin"

# Created by `userpath` on 2020-12-11 14:11:16
export PATH="$PATH:/Users/janrobertschmidt/Library/Python/3.9/bin"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/Users/janrobertschmidt/mambaforge/bin/mamba';
export MAMBA_ROOT_PREFIX='/Users/janrobertschmidt/mambaforge';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/janrobertschmidt/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/janrobertschmidt/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/janrobertschmidt/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/janrobertschmidt/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/janrobertschmidt/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/janrobertschmidt/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

export PATH="/Users/janrobertschmidt/.pixi/bin:$PATH"

pixi_activate() {
    env="${1:-dev310}"
    # pixi shell --manifest-path=$HOME/pixi/${env}/pixi.toml
    eval "$(pixi shell-hook --shell=zsh --manifest-path=$HOME/pixi/${env}/pixi.toml)"
}

