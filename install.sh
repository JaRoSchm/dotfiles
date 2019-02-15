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

# Install sync-settings for Atom
apm install sync-settings

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Anaconda
cd ~/Downloads
curl -O http://repo.continuum.io/archive/Anaconda3-5.1.0-MacOSX-x86_64.sh
bash ./Anaconda3-5.1.0-MacOSX-x86_64.sh
conda update --all --yes
cd ~

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/symlinks/.zshrc" ~
ln -sfv "$DOTFILES_DIR/symlinks/.condarc" ~
ln -sfv "$DOTFILES_DIR/symlinks/.gitconfig" ~
# ln -sfv "$DOTFILES_DIR/symlinks/.mackup.cfg" ~

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
