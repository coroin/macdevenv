#!/bin/bash

# ugly hack (find way to source .bash_profile after composer install)
#export PATH="$PATH:$HOME/.composer/vendor/bin"

# run playbook
ansible-playbook -i ../hosts playbook.yml -vv

# clean up
exit 0