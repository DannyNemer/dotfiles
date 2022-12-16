#!/usr/bin/env zsh

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
brew install \
  coreutils \
  duti \
  fasd \
  fzf \
  gh \
  node \
  powerlevel10k \
  trash \
  yarn \
  zsh-autosuggestions \
  zsh-syntax-highlighting

# Install casks
brew install --cask \
  1password \
  alfred \
  amazon-workspaces \
  bettertouchtool \
  dropbox \
  fig \
  gitup \
  google-chrome \
  grammarly-desktop \
  height \
  istat-menus \
  iterm2 \
  notion \
  postgres-unofficial \
  slack \
  sunsama \
  tableplus \
  visual-studio-code \
  zoom \

# Install `fzf` shell extensions
/usr/local/opt/fzf/install
