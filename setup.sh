#!/bin/bash

# Turn off file prompt for textedit and just open a fresh doc
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

curl -o /tmp/Brewfile https://raw.githubusercontent.com/mattryczek/brew/main/Brewfile 

brew bundle --file=/tmp/Brewfile

# Remove brewfile, installers, and tell brew to clean up too
rm /tmp/Brewfile
rm -rf ~/Library/Caches/Homebrew/downloads
brew cleanup -s

# Rust setup
rustup init
rustc --version
