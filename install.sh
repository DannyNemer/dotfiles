#!/usr/bin/env zsh

# Install Xcode command line tools. Must be first installation.
xcode-select --install

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install GUI programs
brew install \
    1password \
    alfred \
    appcleaner \
    bettertouchtool \
    dash \
    docker \
    dropbox \
    fig \
    font-menlo-for-powerline \
    gitup \
    google-chrome \
    istat-menus \
    iterm2-beta \
    kaleidoscope \
    linear-linear \
    notion \
    postgres-unofficial \
    rescuetime
    slack \
    spotify \
    tableplus \
    visual-studio-code \
    zoom

# Install Homebrew packages
brew install \
    python \
    node \
    yarn \
    git \
    gh \
    cloc \
    coreutils \
    fasd \
    fzf \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    zsh-completions

# Install `fzf` shell extensions
/usr/local/opt/fzf/install
