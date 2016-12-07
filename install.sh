#!/usr/bin/env zsh

# Install Xcode command line tools. Must be first installation.
xcode-select install

# Install Oh-My-Zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh-autosuggestions.
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install GUI programs.
# Must install Java before Elasticsearch, which is installed with Homebrew packages below.
brew tap caskroom/versions
brew cask install alfred bettertouchtool dropbox github-desktop google-chrome iterm2-beta java kaleidoscope mathtype rescuetime spotify sublime-text

# Install Homebrew packages.
brew install elasticsearch kibana fasd fzf htop jq mackup node python zsh-syntax-highlighting

# Install fzf shell extensions.
/usr/local/opt/fzf/install

# Install Sense for Elasticsearch.
kibana plugin --install elastic/sense

# Install Quick Look plugins.
brew cask install qlcolorcode qlmarkdown qlstephen quicklook-json

# Install fonts.
brew tap caskroom/fonts
brew cask install font-source-code-pro

# Install global npm packages.
npm install --global trash-cli devtool diff-so-fancy

# Install pip packages.
# Note: Can alternatively install `grip` with `brew`, however, `brew` would install its Python package dependencies in a sub-folder that only `grip` can access. This excludes the dependencies from normal `pip` upgrade operations and use by other programs. For example, `grip` has the dependency `pygmentize`, which the `cat` (overloading) function also needs and can not access from the `brew` installation of `grip`.
pip install grip