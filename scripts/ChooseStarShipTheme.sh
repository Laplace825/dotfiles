#!/bin/bash

# This script will change the theme of the Starship prompt

STARSHIP_DIR="$DOT_FILE_DIR"/starship

theme=$(fzf --walker-root="$STARSHIP_DIR")

if [ -f "${HOME}/.config/starship.toml" ];then
  rm -f "${HOME}/.config/starship.toml"
fi

ln -s "$theme" "${HOME}/.config/starship.toml"

