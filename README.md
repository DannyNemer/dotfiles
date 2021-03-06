# dotfiles
My dotfiles, which I will gradually construct in the depths of the nights after meaningful work has exhausted me.

### Novelties:
- `git restore-dates [$number]` Restores the commit dates to corresponding author dates of the `$number` most recent commits, or all commits if `$number` is undefined. This is useful after a `git-rebase`.

- `glgrep $pattern` Searches git commits that match `$pattern` while ignoring case.

- `swlog` Prints the timestamps of the 10 most recent sleep and wake events (for OS X portables). This answers the question, "How long have I been at the computer?"

- `mute` Toggles system volume.

- `sleepnow` Puts system to sleep.

- `vol $number` Sets system volume to `$number` on a scale of 0 to 10.

- `odb` Opens current directory on Dropbox.com (if it is in your Dropbox folder), with deleted files visible. This is useful for file recovery.

- `gitstats [$num_days=7]` Prints the number of commits to the current directory's repository for each of the past `$num_days` days.