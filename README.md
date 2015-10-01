# dotfiles
My meticulously crafted dotfiles. I will slowly construct this repo from my existing configuration files in the depths of the nights, after meaningful work has exhausted my cognitive resources.

### Novelties:
- `git restore-dates [$number]` Restores the commit dates to corresponding author dates of the `$number` most recent commits, or all commits if `$number` is undefined. This is useful after a `rebase`.

- `glgrep $pattern` Searches git commits that match `$pattern` while ignoring case.

- `swlog` Prints the timestamps of the 10 most recent sleep and wake events (for OS X portables). This answers the question, "How long have I been at the computer?"

- `mute` Mutes and unmutes system volume.

- `sleepnow` Puts system to sleep.

- `vol $number` Sets system volume to `$number` on a scale of 0 to 10.