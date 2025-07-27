#!/bin/bash

mkdir -p ~/.virtualenvs
python -m venv ~/.virtualenvs/neovim --clear # create a new venv (overwrite if exists)
source ~/.virtualenvs/neovim/bin/activate    # activate the venv

pip install pynvim jupyter_client cairosvg plotly kaleido pnglatex pyperclip
