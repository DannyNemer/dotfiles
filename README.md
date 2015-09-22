# dotfiles
My meticulously crafted dotfiles. I will slowly construct this repo from my existing configuration files in the depths of the nights, after meaningful work has exhausted my cognitive resources.

## `.gitignore`
- `git restore-dates [$number]` Restores the commit dates to corresponding author dates of the `$number` most recent commits, or all commits if `$number` is undefined. This is useful after a rebase.

## `.aliases`
- `swlog` Prints the timestamps of the 10 most recent sleep and wake events (for OS X portables). This answers the question, "How long have I been at the computer?"

- `mute` Mutes system volume.

- `sleepnow` Puts system to sleep.

## `.functions`
- `vol $number` Sets system volume to `$number` on a scale of 0 to 10.