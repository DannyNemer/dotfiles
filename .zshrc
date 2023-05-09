# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#############
#  Aliases  #
#############

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
alias gb='git --no-pager branch'
alias gcb='git checkout -b'
alias gbl='git blame -b -s -w'
alias gc='git commit --verbose'
alias gca='git commit --verbose --amend'
alias gcm='git checkout main'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdca='git diff --cached'
alias gfa='git fetch --all --prune'
alias gl='git pull --verbose'
alias glg='git log --stat --color --graph --decorate'
alias glgrep='git log --regexp-ignore-case --grep'
alias glol='git log --pretty="%Cred%h%Creset - %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias gmt='git mergetool --no-prompt'
alias gp='git push --verbose'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpf='git push --verbose --force-with-lease'
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

# Third-party
alias code='code-insiders'

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
  HAS_CHANGES="$(git status -s)";
  if [[ -n $HAS_CHANGES ]]; then
    git stash;
  fi;

  git checkout production;
  git reset --hard main;
  echo "Type 'yes' to push to production:";
  read confirmation;
  if [ "$confirmation" = "yes" ]; then
    git push --verbose --force-with-lease origin production;
  fi;
  git checkout main;

  if [[ -n $HAS_CHANGES ]]; then
    git stash pop --quiet;
  fi;
}

#############
#  Exports  #
#############

# Set VS Code as default editor
export EDITOR="code-insiders"

# Add Homebrew packages to PATH
export PATH="/opt/homebrew/bin:$PATH"

# Add Postgres command line tools to PATH
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

###########
#  Shell  #
###########

# Active Python virtual environment for Conductor
source $HOME/conductor-python/env/bin/activate

# oh-my-zsh - only used to enhance history
HISTSIZE=100000
HIST_STAMPS="yyyy-mm-dd"
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"

# Prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0.1
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $%{%b%f%k%F{yellow}%} %{%f%}"
POWERLEVEL9K_TIME_FORMAT="%D{%I:%M:%S %p}" # 12-hour format
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# fasd
eval "$(fasd --init auto)"
alias o='a -e code-insiders'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh-autosuggestions - must be at the end of .zshrc
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting - must be at the end of .zshrc
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
