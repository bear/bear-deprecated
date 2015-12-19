#!/bin/bash
set -e

# source: https://github.com/herrbischoff/awesome-osx-command-line/blob/master/README.md

# done write .ds_store file to usb or network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# save to local disk and not icloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
