#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

curl -o /tmp/Brewfile https://raw.githubusercontent.com/mattryczek/brew/main/Brewfile 

brew bundle --file=/tmp/Brewfile

rm /tmp/Brewfile
rm -rf ~/Library/Caches/Homebrew/downloads