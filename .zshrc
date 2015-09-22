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

# Set location for brew-cask apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

# Prints the timestamps of the 10 most recent sleep and wake events (for OS X portables)
alias swlog='pmset -g log | grep -e " Sleep  " -e " Wake  " | tail -n 10'