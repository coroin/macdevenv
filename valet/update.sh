#!/bin/bash

# run playbook
ansible-playbook -i ../hosts playbook.yml -vv

# clean up
exit 0
