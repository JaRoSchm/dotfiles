brew install pyenv
pyenv install 3.8.5
pyenv global 3.8.5
brew install pipx
pipx ensurepath
pipx install python-lsp-server
pipx install ruff
pipx inject python-lsp-server pylsp-rope
pipx inject python-lsp-server pyls-memestra
pipx install proselint
pipx install vitables

# install miniconda
