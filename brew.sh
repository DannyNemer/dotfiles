#!/usr/bin/env zsh

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install command line programs
brew install node go

# Install GUI programs
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew cask install airmail-beta alfred bettertouchtool dropbox github-desktop google-chrome iterm2 kaleidoscope spotify sublime-text3

# Install Quick Look plugins
brew cask install suspicious-package qlcolorcode qlmarkdown qlstephen quicklook-json

# Install fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro