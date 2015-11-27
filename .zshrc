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
plugins=(git brew brew-cask npm)

# Load oh-my-zsh.
source $ZSH/oh-my-zsh.sh

########################
# Custom configuration #
########################

# Number of lines to save to HISTFILE.
HISTSIZE=100000
# Number of lines to save in a sessions.
SAVEHIST=100000

# Write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY
# Write to the history file immediately, not when the shell exits.
setopt INC_APPEND_HISTORY
# Share history between all sessions.
setopt SHARE_HISTORY
# Expire a duplicate event first when trimming history.
setopt HIST_EXPIRE_DUPS_FIRST
# Do not record an event that was just recorded again.
setopt HIST_IGNORE_DUPS
# Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_ALL_DUPS
# Do not display a previously found event.
setopt HIST_FIND_NO_DUPS
# Do not write a duplicate event to the history file.
setopt HIST_SAVE_NO_DUPS
# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE
# Remove superfluous blanks before recording entry.
setopt HIST_REDUCE_BLANKS
# Do not execute immediately upon history expansion.
setopt HIST_VERIFY

# Auto changes to a directory without typing cd.
setopt AUTO_CD
# Push the old directory onto the stack on cd.
setopt AUTO_PUSHD
# Do not store duplicates in the stack.
setopt PUSHD_IGNORE_DUPS
# Change directory to a path stored in a variable.
setopt CDABLE_VARS

# Load shell dotfiles.
for file in $HOME/.{aliases,exports,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# fasd.
eval "$(fasd --init auto)"

# fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Syntax highlighting.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh