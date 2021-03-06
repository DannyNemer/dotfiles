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

# Add Postgress command line tools to PATH
export PATH=/Applications/Postgres.app/Contents/Versions/12/bin:$PATH

################
#  Kubernetes  #
################

# 1Password
export KUBECONFIG=$HOME/.kube/dev-danny-config
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

# Use VS Code as editor
export KUBE_EDITOR='code --wait --new-window'

function fetch_kconf {
  local cluster="$1"
  local session="$(op signin afresh_team --raw)"
  op get item --session="${session}" --vault="IF (${cluster})" "k8s kubeconfig (${cluster})" | jq -r '.details.notesPlain' >! "${HOME}/.kube/${cluster}-config"
}

################
#    Python    #
################

# Add unversioned symlinks `python` -> `python3`, `pip` -> `pip3`, etc.
# - Must *prepend* path to $PATH to prioritize over `/usr/bin/python`, etc.
export PATH=/usr/local/opt/python/libexec/bin:$PATH
# export PATH=/usr/local/opt/python@3.7/bin:$PATH

# Activate `afresh-core` virtual environment.
# source ~/afresh-core/af-env/bin/activate

# Fix Python-OSX multi-threading issues: https://stackoverflow.com/a/52230415/1667518
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

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
alias 'gca!'='git commit --verbose --amend --no-edit'
alias ga='git add --verbose'
alias gap='git add --verbose --patch'
alias gau='git add --verbose --update'
alias gb='git branch'
alias gbl='git blame -b -s -w'
alias gc='git commit --verbose'
alias gca='git commit --verbose --amend'
alias gcm='git checkout master'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='GIT_EDITOR=true git cherry-pick --continue'
alias gd='git diff'
alias gdca='git diff --cached'
alias gfa='git fetch --all --prune'
alias gl='git pull --verbose'
alias glg='git log --stat --color --graph --decorate'
alias glgrep='git log --regexp-ignore-case --grep'
alias glol='git log --pretty="%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias gmt='git mergetool --no-prompt'
alias gp='git push --verbose'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='GIT_EDITOR=true git rebase --continue'
alias grbi='git rebase --interactive'
alias grbm='git pull --rebase origin master'
alias grhh='git reset --hard'
alias grhm='git reset --hard origin/master'
alias grlg='git reflog --date=relative'
alias groh='git reset origin/$(git_current_branch) --hard'
alias gs='git show'
alias gst='git status --short'
alias gsta='git stash'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --patch'
alias git-comp-prod='hub compare $(git rev-parse origin/production | cut -c 1-8)...$(git rev-parse origin/staging | cut -c 1-8)'
alias git-comp-staging='hub compare $(git rev-parse origin/staging | cut -c 1-8)...$(git rev-parse origin/master | cut -c 1-8)'

# Alembic
alias ar='alembic revision -m'

# Terraform
alias tf='terraform'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
