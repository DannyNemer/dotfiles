# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Path to your oh-my-zsh installation.
export ZSH="/Users/danny/.oh-my-zsh"

ZSH_THEME=powerlevel10k/powerlevel10k

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0.1
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $%{%b%f%k%F{yellow}%} %{%f%}"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

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


# Add Homebrew packages to PATH
export PATH=/usr/local/bin:$PATH

# fasd
eval "$(fasd --init auto)"
alias o='a -e code'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add Postgress command line tools to PATH
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

################
#    Python    #
################

# Add unversioned symlinks `python` -> `python3` -> `python3.9`, `pip` -> `pip3`, etc.
# - Must *prepend* path to $PATH to prioritize over `/usr/bin/python`, etc.
export PATH=/usr/local/opt/python/libexec/bin:$PATH

################
#   Aliases    #
################

# Upgrades all brew packages
alias bubu='brew update && brew outdated && brew upgrade && brew cleanup'

# Prints timestamps of 10 most recent sleep and wake events (for macOS portables)
alias swlog='pmset -g log | grep --color=always -e " Sleep  " -e " Wake  " | tail -n 10'

# Reloads the shell
alias reload='exec $SHELL -l'

# System
alias l='gls --color --group-directories-first -lah'
alias ..='cd ..'

# Git
alias 'gca!'='git commit --verbose --amend --no-edit'
alias ga='git add --verbose'
alias gap='git add --verbose --patch'
alias gau='git add --verbose --update'
alias gb='git branch'
alias gbl='git blame -b -s -w'
alias gc='git commit --verbose'
alias gca='git commit --verbose --amend'
alias gcm='git checkout main'
alias gco='git checkout'
alias gd='git diff'
alias gdca='git diff --cached'
alias gfa='git fetch --all --prune'
alias gl='git pull --verbose'
alias glg='git log --stat --color --graph --decorate'
alias glgrep='git log --regexp-ignore-case --grep'
alias glol='git log --pretty="%Cred%h%Creset - %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias gmt='git mergetool --no-prompt'
alias gp='git push --verbose'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbm='git pull --rebase origin main'
alias grhh='git reset --hard'
alias grhm='git reset --hard origin/main'
alias groh='git reset origin/$(git_current_branch) --hard'
alias gundo='git reset --soft HEAD~1'
alias grlg='git reflog --date=relative'
alias gs='git show'
alias gst='git status --short'
alias gsta='git stash'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --patch'
alias gweb='gh repo view --web'
alias git-comp-prod='open https://github.com/conductor-io/conductor/compare/production...main'

# Print the number of commits to the current directory's repository for each of
# the past `$num_days` days.
function git-commit-count() {
	for ((i=$((${1:-7} - 1)); i > -1; i--)); do
		DAY="`date -v-${i}d "+%b %d"`"
		git rev-list main --count --after="${DAY} 00:00:00" --before="${DAY} 23:59:59" | awk -v day=$DAY '{print day ": " $1}'
	done
}

# Reset the branch "production" to the head of "main" without switching the
# current branch and require confirmation before pushing.
function push-to-prod() {
  git checkout production
  git reset --hard main
  echo "Type 'yes' to push to production:"
  read confirmation
  if [ "$confirmation" = "yes" ]; then
    git push origin production
  fi
  git checkout main
}

#################
#  Zsh Plugins  #
#################

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting (must be at the end of ~/.zshrc)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
