#!/usr/bin/env zsh

# Install Oh-My-Zsh.
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Homebrew packages.
brew install node012 go fasd mackup zsh-syntax-highlighting
brew install --HEAD fzf
/usr/local/Cellar/fzf/HEAD/install

# Install GUI programs.
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew cask install airmail-beta alfred bettertouchtool dropbox github-desktop google-chrome iterm2 kaleidoscope mathtype spotify sublime-text3

# Install Quick Look plugins.
brew cask install suspicious-package qlcolorcode qlmarkdown qlstephen quicklook-json

# Install fonts.
brew tap caskroom/fonts
brew cask install font-source-code-pro

# Install global npm packages.
npm install --global trash-cli node-inspector

# Install pip.
sudo easy_install pip

# Install pip packages.
sudo pip install grip