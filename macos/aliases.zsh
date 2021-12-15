# show or hide hidden files in finder
alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder'
alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles -boolean false; killall Finder'
