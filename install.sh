#!/usr/bin/env zsh

# Install Oh-My-Zsh.
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh-autosuggestions.
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install GUI programs.
# Must install java before elasticsearch, which is installed with Homebrew packages below.
brew tap caskroom/versions
brew cask install alfred bettertouchtool dropbox github-desktop google-chrome iterm2-beta java kaleidoscope mathtype spotify sublime-text3

# Install Homebrew packages.
brew install elasticsearch kibana fasd htop mackup node zsh-syntax-highlighting
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

# Install pip packages.
sudo pip install grip