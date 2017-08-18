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

## TODO: put this in ansible
cat >> ~/.bash_profile <<EOF
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
EOF

# clean up
exit 0
