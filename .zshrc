# Path to your oh-my-zsh installation.
export ZSH="/Users/danny/.oh-my-zsh"

ZSH_THEME=powerlevel10k/powerlevel10k

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $%{%b%f%k%F{yellow}%} %{%f%}"

# Display command execution time stamp in `history` output. Requires oh-my-zsh.
HIST_STAMPS='yyyy-mm-dd'

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

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
# setopt HIST_IGNORE_ALL_DUPS
# Do not display a previously found event.
setopt HIST_FIND_NO_DUPS
# Do not write a duplicate event to the history file.
# setopt HIST_SAVE_NO_DUPS
# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE
# Remove superfluous blanks before recording entry.
setopt HIST_REDUCE_BLANKS
# Do not execute immediately upon history expansion.
setopt HIST_VERIFY


# fasd
eval "$(fasd --init auto)"
alias v='f -e vim'
alias o='a -e open'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add Postgress command line tools to PATH.
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Kubernetes
export KUBECONFIG=$HOME/azure-kubeconfig-staging
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

################
#    Python    #
################

# Add unversioned symlinks `python` -> `python3`, `pip` -> `pip3`, etc.
# - Must *prepend* path to $PATH to prioritize over `/usr/bin/pytho`, etc.
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# Activate `afresh-core` virtual environment.
source ~/afresh-core/af-env/bin/activate

export AIRFLOW_HOME=$HOME/afresh-core/services/airflow/

################
#   Aliases    #
################

# Docker
alias dc='docker-compose'

# Moves files to ~/.Trash (enabling Finder's "Put back" feature)
alias trash='trash -F'

# Upgrades all brew packages
alias bubu='brew update && brew outdated && brew upgrade && brew cleanup'

# Prints timestamps of 10 most recent sleep and wake events (for macOS portables)
alias swlog='pmset -g log | grep --color=always -e " Sleep  " -e " Wake  " | tail -n 10'

# Reloads the shell
alias reload='exec $SHELL -l'

# System
alias l='gls --color --group-directories-first -lah'

# Git
alias ga='git add --verbose'
alias gap='git add --verbose --patch'
alias gau='git add --verbose --update'
alias gc='git commit --verbose'
alias gca='git commit --verbose --amend'
alias 'gca!'='git commit --verbose --amend --no-edit'
alias grbi='git rebase --interactive'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gmt='git mergetool --no-prompt'
alias gp='git push --verbose'
alias gl='git pull --verbose'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gsts='git stash show --patch'
alias gst='git status --short'
alias glg='git log --stat --color --graph --decorate'
alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'
alias glgrep='git log --regexp-ignore-case --grep'
alias grlg='git reflog --date=relative'
alias gd='git diff'
alias gdca='git diff --cached'
alias gs='git show'
alias gbl='git blame -b -s -w'
alias gco='git checkout'
alias gcm='git checkout master'
alias gb='git branch'
alias git-remove-untracked='git fetch --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -d'
alias git-comp-staging='hub compare $(git rev-parse origin/staging | cut -c 1-8)...$(git rev-parse origin/master | cut -c 1-8)'
alias git-comp-prod='hub compare $(git rev-parse origin/production | cut -c 1-8)...$(git rev-parse origin/staging | cut -c 1-8)'

alias jestf='jest --forceExit'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
