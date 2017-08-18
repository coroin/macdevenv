#!/bin/bash

# install xcode
xcode-select --install

# install ansible (requires pip)
sudo easy_install pip
sudo pip install ansible

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"