#!/bin/bash

# install xcode
xcode-select --install

# install ansible (requires pip)
sudo easy_install pip
sudo pip install ansible

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# ugly hack (find way to source .bash_profile after composer install)
export PATH="$PATH:$HOME/.composer/vendor/bin"

# run playbook
ansible-playbook -i ../hosts playbook.yml -vv

# clean up
exit 0
