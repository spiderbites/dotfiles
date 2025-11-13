## try re-writing with nix/flakes
# https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file#contributing
# https://dreamsofcode.io/blog/nix-darwin-my-favorite-package-manager-for-macos

# # Sets reasonable macOS defaults.
# #
# # Or, in other words, set shit how I like in macOS.
# #
# # The original idea (and a couple settings) were grabbed from:
# #   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# #
# # Run ./set-defaults.sh and you'll be good to go.

# # Disable press-and-hold for keys in favor of key repeat.
# defaults write -g ApplePressAndHoldEnabled -boolean false

# # Always open everything in Finder's list view. This is important.
# defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# # Show the ~/Library folder.
# xattr -d com.apple.FinderInfo ~/Library

# # Set a really fast key repeat.
# defaults write NSGlobalDomain KeyRepeat -int 1

# # Set the Finder prefs for showing a few different volumes on the Desktop.
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# # Set up Safari for development.
# defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# defaults write com.apple.Safari IncludeDevelopMenu -bool true
# defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
# defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# # Show macOS app switcher across all monitors
# defaults write com.apple.Dock appswitcher-all-displays -bool true