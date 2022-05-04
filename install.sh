#!/usr/bin/env bash

echo "Setting up your Mac."

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update
brew upgrade

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Xcode Command Line Tools
xcode-select --install

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/symlinks/.zshrc" ~
ln -sfv "$DOTFILES_DIR/symlinks/.condarc" ~
ln -sfv "$DOTFILES_DIR/symlinks/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/symlinks/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/symlinks/.vimrc" ~
ln -sfv "$DOTFILES_DIR/symlinks/.vim" ~
ln -sfv "$DOTFILES_DIR/symlinks/.p10k.zsh" ~
ln -sfv "$DOTFILES_DIR/symlinks/proselint.json" "$HOME/.config/proselint/config.json"

# Python setup
python3 -m pip install --user pipx

python3 -m pipx ensurepath
source ~/.zshrc
pipx install black
pipx install youtube-dl
pipx install python-language-server

curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
source ~/.zshrc
poetry completions zsh > /usr/local/share/zsh-completions/_poetry

# install anaconda
# following: https://stackoverflow.com/a/58045893
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
source Miniconda3-latest-MacOSX-arm64.sh
source ~/miniconda3/bin/activate
conda init zsh
conda config --set auto_activate_base false

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
