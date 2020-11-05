#!/usr/bin/env zsh

# Install Xcode command line tools. Must be first installation.
xcode-select --install

# Install Oh-My-Zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install GUI programs.
brew install 1password alfred appcleaner bettertouchtool dash docker dropbox font-menlo-for-powerline gitup google-chrome istat-menus iterm2-beta kaleidoscope postgres rescuetime slack spotify tableplus visual-studio-code zoomus

# Install Homebrew packages.
brew install coreutils diff-so-fancy fasd fzf htop node python trash yarn zsh-autosuggestions zsh-syntax-highlighting

# Install `fzf` shell extensions.
/usr/local/opt/fzf/install
