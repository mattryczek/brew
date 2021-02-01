#!/bin/bash

# Turn off file prompt for textedit and just open a fresh doc
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false

# Turn off .DS_Store creation on USB and network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

curl -o /tmp/Brewfile https://raw.githubusercontent.com/mattryczek/brew/main/Brewfile 

brew bundle --file=/tmp/Brewfile

# Remove brewfile, installers, and tell brew to clean up too
rm /tmp/Brewfile
rm -rf ~/Library/Caches/Homebrew/downloads
brew cleanup -s

# Pull down fix-tid.sh and store /usr/local/bin
curl -o /usr/local/bin/fix-tid https://gist.githubusercontent.com/mattryczek/d2b01d1d5b354d60e89325e428795245/raw/d7d20ee3a0b7b6a60cfd5a95a24243be46a323a1/fix-tid.sh
chmod +x /usr/local/bin/fix-tid
/usr/local/bin/fix-tid
