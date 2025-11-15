# Sets reasonable macOS defaults.
# Run ./set-defaults.sh

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -boolean false

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 1

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show macOS app switcher across all monitors
defaults write com.apple.Dock appswitcher-all-displays -bool true

# Save screenshots to clipboard
defaults write com.apple.screencapture target clipboard