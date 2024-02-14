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
  python \
  romkatv/powerlevel10k/powerlevel10k \
  trash \
  zoxide \
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
  kaleidoscope \
  linear-linear \
  notion \
  notion-calendar \
  postgres-unofficial \
  reflect \
  rewind \
  slack \
  tableplus \
  visual-studio-code \
  xscope \
  zoom

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install `fzf` shell extensions
/usr/local/opt/fzf/install

# Enable `yarn` via `corepack`, which is included with Node.js
corepack enable
