#!/bin/bash

# This Record what plugin installed

## plugins

#  yazi-rs/plugins:max-preview
#  Reledia/glow
#  AnirudhG07/nbpreview
#  hankertrix/augment-command
#  yazi-rs/plugins:git
#  Ape/simple-status
#  KKV9/command
#  yazi-rs/plugins:full-border

##  install using ya
# `ya` is a package mananger provided by `yazi` .

packages=(
  "yazi-rs/plugins:max-preview"
  "Reledia/glow"
  "AnirudhG07/nbpreview"
  "hankertrix/augment-command"
  "yazi-rs/plugins:git"
  "Ape/simple-status"
  "KKV9/command"
  "yazi-rs/plugins:full-border"
)
for i in "${packages[@]}"; do 
  ya pack -a "$i"
done

ya pack -u
