#!/usr/bin/env zsh

# Install Oh-My-Zsh.
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh-autosuggestions.
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install GUI programs.
# Must install Java before Elasticsearch, which is installed with Homebrew packages below.
brew tap caskroom/versions
brew cask install alfred bettertouchtool dropbox github-desktop google-chrome iterm2-beta java kaleidoscope mathtype rescuetime spotify sublime-text3

# Install Homebrew packages.
brew install elasticsearch kibana fasd htop jq mackup node zsh-syntax-highlighting
brew install --HEAD fzf
/usr/local/Cellar/fzf/HEAD/install

# Install Sense for Elasticsearch.
kibana plugin --install elastic/sense

# Install Quick Look plugins.
brew cask install suspicious-package qlcolorcode qlmarkdown qlstephen quicklook-json

# Install fonts.
brew tap caskroom/fonts
brew cask install font-source-code-pro

# Install global npm packages.
npm install --global trash-cli devtool diff-so-fancy

# Install pip.
sudo easy_install pip
sudo easy_install --upgrade six

# Install pip packages.
sudo pip install grip sklearn

# Install TensorFlow, CPU only, for Python 2.7.
# Ignore six because pip attempts to update the out-of-date version built-in to macOS and fails because System Integrity Protection prevents anything (even root) from modifying its directory.
sudo pip install --upgrade https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-0.10.0rc0-py2-none-any.whl --ignore-installed six