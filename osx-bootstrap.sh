#!/bin/sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible
brew install caskroom/cask/brew-cask
#ansible-playbook osx.yml -i inventory

