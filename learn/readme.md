# Coroin LocalDev Step-by-Step Guide

Learn [ansible](https://www.ansible.com/) by automating the setup/config of a mac development machine.

#### Step 1 - Install mac development tools

`xcode-select --install`

We will create a shell script named `install.sh`.

#### Step 2 - Install ansible using python-pip

`sudo easy_install pip`

`sudo pip install ansible`

#### Step 3 - Install homebrew

`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

#### Ugly hack to add composer to PATH

`export PATH="$PATH:$HOME/.composer/vendor/bin"`