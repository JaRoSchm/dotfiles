brew install uv

uv tool install vitables --python="/opt/homebrew/bin/python3" --with pyside6
uv tool install proselint --python="/opt/homebrew/bin/python3"
uv tool install python-lsp-server --with pyls-memestra --with pylsp-rope --python="/opt/homebrew/bin/python3"
