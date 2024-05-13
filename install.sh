#!/usr/bin/env zsh

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
brew install \
  coreutils \
  duti \
  fzf \
  gh \
  node@20 \
  pnpm \
  yarn \
  python@3.11 \
  romkatv/powerlevel10k/powerlevel10k \
  trash \
  zoxide \
  zsh-autosuggestions \
  zsh-syntax-highlighting

# Install casks
brew install --cask \
  1password \
  alfred \
  amazon-q \
  amazon-workspaces \
  bettertouchtool \
  dropbox \
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

# Install global `npm` packages
npm install --global \
  mintlify

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install `fzf` shell extensions
/usr/local/opt/fzf/install
