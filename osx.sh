#!/usr/bin/env zsh

###################
# System          #
###################

# Disable the sound effects on boot.
sudo nvram SystemAudioVolume=" "

# Restart automatically if the computer freezes.
sudo systemsetup -setrestartfreeze on

# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default.
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default.
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Use punctuation (e.g., periods) for word boundaries when highlighting text (e.g., double-clicking), and disable commas in system-formatted numbers.
defaults write NSGlobalDomain AppleLocale en_US_POSIX

# Use dark menu bar, Dock, and Spotlight.
defaults write NSGlobalDomain AppleInterfaceStyle "Dark"

# Disable audio beep feedback when volume is changed.
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool false

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

# Disable shadow in screenshots.
defaults write com.apple.screencapture disable-shadow -bool true

# Use scroll gesture with the Ctrl (^) modifier key to zoom.
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Follow the keyboard focus while zoomed in.
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Use plain text mode for new TextEdit documents.
defaults write com.apple.TextEdit RichText -bool false

# Disable automatic emoji substitution in Messages.app.
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

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
# Disable the warning before emptying the Trash.
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Empty Trash securely by default.
defaults write com.apple.finder EmptyTrashSecurely -bool true
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
# Disable Dashboard.
defaults write com.apple.dashboard mcx-disabled -bool true

###################
# Menu Bar        #
###################

# Use these menu bar items, in this left-to-right order: Airport, Battery, Clock.
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"
# Show percentage in Battery menu bar item.
defaults write com.apple.menuextra.battery ShowPercent -bool true
# Show day, date, and seconds in Clock menu bar item.
defaults write com.apple.menuextra.clock DateFormat "EEE MMM d  h:mm:ss a"

###################
# Applications    #
###################

# Use plain-text mode as default in TextEdit.app.
defaults write com.apple.TextEdit RichText -int 0

# Use 2-space tabs and wrap text in QuickLook for code files.
defaults write org.n8gray.QLColorCode extraHLFlags '-t 2 -W'
defaults write org.n8gray.QLColorCode font SourceCodePro-Medium

# Disable smart quotes, smart dashes, and automatic spelling correction in GitHub Desktop.app.
defaults write com.github.GitHub NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write com.github.GitHub NSAutomaticDashSubstitutionEnabled -bool false
defaults write com.github.GitHub NSAutomaticSpellingCorrectionEnabled -bool false