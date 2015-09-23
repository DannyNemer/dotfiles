# Number of lines to save to HISTFILE
HISTSIZE=100000
# Number of lines to save in a sessions
SAVEHIST=100000

# Delete old recorded entry if new entry is a duplicate
setopt HIST_IGNORE_ALL_DUPS
# Prevent duplicate entries in the history file
setopt HIST_SAVE_NO_DUPS
# Remove superfluous blanks before recording entry
setopt HIST_REDUCE_BLANKS

# Load shell dotfiles
for file in ~/.{aliases,exports,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# fasd
fasd_cache="$ZSH_CACHE_DIR/fasd-init-cache"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init autol >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

alias v='f -e vim'
alias o='a -e open'
alias st='f -e subl'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh