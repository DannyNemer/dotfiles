#!/usr/bin/env zsh

###################
# System          #
###################

# Restart automatically if the computer freezes.
sudo systemsetup -setrestartfreeze on

# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Save to disk (not to iCloud) by default.
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Use dark menu bar, Dock, and Spotlight.
defaults write NSGlobalDomain AppleInterfaceStyle "Dark"

# Disable translucency in the menu bar, side bars, and elsewhere.
defaults write com.apple.universalaccess reduceTransparency -bool true

# Restore open documents and windows when re-opening apps.
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool true

# Set global keyboard shortcut: shift+command+v -> "Paste and Match Style".
defaults write NSGlobalDomain NSUserKeyEquivalents -dict  "Paste and Match Style" "@\$v"

# Check for software updates daily, not just once per week.
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Automatically quit printer app once the print jobs complete.
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the "Are you sure you want to open this application?" dialog.
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Use scroll gesture with the Ctrl (^) modifier key to zoom.
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Require password immediately after sleep or screen saver begins.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable power chime sound effect.
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true && open /System/Library/CoreServices/PowerChime.app

# Display Crash Reporter as a notification.
defaults write com.apple.CrashReporter UseUNC 1

###################
# Finder          #
###################

# Allow text selection in Quick Look.
defaults write com.apple.finder QLEnableTextSelection -bool true
# Use list view in all Finder windows by default.
defaults write com.apple.finder FXPreferredViewStyle clmv
# Keep folders on top when sorting by name.
defaults write com.apple.finder _FXSortFoldersFirst true
# Disable the warning before emptying the Trash.
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Show the ~/Library folder.
chflags nohidden ~/Library
# Set desktop background.
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/Danny/Dropbox/Projects/config/wallpapers/wallpaper with black menubar.png"'

###################
# Dock, Dashboard #
###################

# Set the icon size of Dock items to 64 pixels.
defaults write com.apple.dock tilesize -int 64
# Show indicator lights for open applications in the Dock.
defaults write com.apple.dock show-process-indicators -bool true
# Automatically hide and show the Dock.
defaults write com.apple.dock autohide -bool true
# Do not automatically rearrange Spaces using MRU.
defaults write com.apple.dock mru-spaces -bool false

###################
# Applications    #
###################

# Use plain text mode for new TextEdit.app documents.
defaults write com.apple.TextEdit RichText -bool false

# Disable automatic emoji substitution in Messages.app.
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Use 2-space tabs and wrap text in QuickLook for code files.
defaults write org.n8gray.QLColorCode extraHLFlags '-t 2 -W'
defaults write org.n8gray.QLColorCode font SourceCodePro-Medium

# Disable smart quotes, smart dashes, and automatic spelling correction in GitHub Desktop.app.
defaults write com.github.GitHub NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write com.github.GitHub NSAutomaticDashSubstitutionEnabled -bool false
defaults write com.github.GitHub NSAutomaticSpellingCorrectionEnabled -bool false

# Disable App Nap for Spotify.app to prevent it from pausing while in background.
defaults write com.spotify.client NSAppSleepDisabled -bool YES
