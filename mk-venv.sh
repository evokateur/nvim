#!/bin/bash

mkdir -p "$HOME/.virtualenvs"
python -m venv "$HOME/.virtualenvs/neovim" --clear # create a new venv (overwrite if exists)
source "$HOME/.virtualenvs/neovim/bin/activate"    # activate the venv

if [[ "$VIRTUAL_ENV" != "$HOME/.virtualenvs/neovim" ]]; then
    echo "$HOME/.virtualenvs/neovim not activated, exiting.."
    exit 1
fi

pip install pynvim jupyter_client cairosvg plotly kaleido pnglatex pyperclip
