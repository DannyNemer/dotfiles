#######################
# Oh My Zsh           #
#######################

# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set oh-my-zsh theme.
ZSH_THEME='robbyrussell'

# Display command execution time stamp in `history` output. This requires oh-my-zsh.
HIST_STAMPS='yyyy-mm-dd'

# Set oh-my-zsh plugins.
plugins=(git brew brew-cask npm golang)

# Load oh-my-zsh.
source $ZSH/oh-my-zsh.sh

########################
# Custom configuration #
########################

# Number of lines to save to HISTFILE.
HISTSIZE=100000
# Number of lines to save in a sessions.
SAVEHIST=100000

# Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_ALL_DUPS
# Prevent duplicate entries in the history file.
setopt HIST_SAVE_NO_DUPS
# Remove superfluous blanks before recording entry.
setopt HIST_REDUCE_BLANKS

# Set a tab stop every 2 columns.
tabs -2

# Load shell dotfiles.
for file in $HOME/.{aliases,exports,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Fasd.
fasd_cache="$ZSH_CACHE_DIR/fasd-init-cache"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init autol >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Syntax highlighting.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh