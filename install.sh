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
  yarn \
  zsh-autosuggestions \
  zsh-syntax-highlighting

# Add un-versioned symlinks: `python` -> `python3` -> `python3.11`
ln -s /opt/homebrew/bin/python3 /opt/homebrew/bin/python
ln -s /opt/homebrew/bin/pip3 /opt/homebrew/bin/pip

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
  zoom

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install `fzf` shell extensions
/usr/local/opt/fzf/install
