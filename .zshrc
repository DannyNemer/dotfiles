# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#############
#  Aliases  #
#############

# Upgrades all brew packages.
alias bubu='brew update && brew outdated && brew upgrade && brew cleanup'

# Prints timestamps of 10 most recent sleep and wake events (for macOS portables).
alias swlog='pmset -g log | grep --color=always -e " Sleep  " -e " Wake  " | tail -n 10'

# Reloads the shell.
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
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
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
alias grbm='git rebase main'
alias grhh='git reset --hard'
alias grhm='git reset --hard main'
alias groh='git reset --hard origin/$(git_current_branch)'
alias gundo='git reset --soft HEAD~1'
alias grlg='git reflog --date=relative'
alias gs='git show'
alias gst='git status --short'
alias gsta='git stash --include-untracked'
alias gstas='git stash --staged'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --patch'

# GitHub CLI
alias ghr='gh repo view --web'
alias gcmp="gh pr create --web --base production --head main --web"

# Create a new PR or open an existing one.
gpr() {
  # Create a remote branch if it does not exist.
  git push --set-upstream origin $(git_current_branch)

  # Check an open PR exists.
  if gh pr view --json state --jq '.state == "OPEN"' >/dev/null 2>&1; then
    # Open the existing PR if it's open.
    gh pr view --web
  else
    # Create a new PR if the PR does not exist or is closed/merged.
    gh pr create --web
  fi
}

# Misc
alias t='pnpm ts-node --transpileOnly'
alias j='pnpm jest'
alias p='pnpm'
alias pi='pnpm install'
alias pt='pnpm test'
alias pl='pnpm lint'
alias pup='pnpm update --interactive --recursive'

# Print the number of git commits authored on each of the past `$num_days` days
# (default: 7) for the current directory's git repository.
git-commit-count() {
  n=${1:-7}
  for (( i=0; i<$n; i++ ))
  do
    date=$(date -v-${i}d "+%Y-%m-%d")
    formatted_date=$(date -v-${i}d "+%b %d")
    # Count the number of commits based on author date, not commit date to count
    # amended commits on the day they were originally created.
    commits=$(git log --pretty=format:'%ad' --date=short | grep "$date" | wc -l)
    echo "$formatted_date: $commits"
  done
}

# Reset the branch "production" to the head of "main" without switching the
# current branch and require system password before pushing.
push-to-prod() {
  HAS_CHANGES="$(git status -s)"
  if [[ -n $HAS_CHANGES ]]; then
    git stash
  fi

  git checkout production
  git reset --hard main

  # Invalidate any existing sudo timestamp and prompt for password.
  sudo -k
  if sudo true; then
    git push --verbose --force-with-lease origin production
  else
    echo "Authentication failed. Push to production aborted."
  fi

  git checkout main

  if [[ -n $HAS_CHANGES ]]; then
    git stash pop --quiet
  fi
}

# Copy the content of all files in a directory to the clipboard for RAG.
copy_files_with_content() {
  if [ -z "$1" ]; then
    echo "Usage: copy_files_with_content <directory>"
    return 1
  fi

  local DIR="$1"
  local OUTPUT="The following are all of the files in the directory $DIR:\n\n"
  local FILES=()
  while IFS= read -r -d '' file; do
    FILES+=("$file")
    OUTPUT+="$file:\n\`\`\`\n$(cat "$file")\n\`\`\`\n\n"
  done < <(find "$DIR" \( -name "*.js" -o -name "*.ts" -o -name "*.jsx" -o -name "*.tsx" -o -name "*.yaml" -o -name "*.json" -o -name "*.mdx" \) -type f -print0)

  echo -n "$OUTPUT" | pbcopy
  echo "Copied to clipboard!"
  echo "Included files:"

  for file in "${FILES[@]}"; do
    echo "- $file"
  done
}

#############
#  Exports  #
#############

# Set VS Code as default editor.
export EDITOR="code"

# Add Homebrew packages to PATH.
export PATH="/opt/homebrew/bin:$PATH"

# Add Postgres command line tools to PATH.
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

# Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
# `python3`, `python3-config`, `pip3` etc., respectively.
export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"

# Add `node@20` to PATH.
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

###########
#  Shell  #
###########

# Active Python virtual environment for Conductor.
source $HOME/conductor-test/venv/bin/activate

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
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
eval "$(zoxide init zsh)"

# zsh-autosuggestions - must be at the end of .zshrc
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting - must be at the end of .zshrc
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
