# Coroin Mac Setup (Without Development Tools) using Ansible

This script automates the install of a Mac using [ansible](https://www.ansible.com/) to setup productivity and creative tools, including some items from the apple store.

This is similar to the [learn](learn/readme.md) single-file playbook with a more traditional ansible project structure:

```
nodev/
├── install.sh
├── playbook.yml
├── readme.md
├── roles
│   └── setup
│       ├── handlers
│       │   └── main.yml
│       ├── tasks
│       │   ├── homebrew.yml
│       │   ├── macdock.yml
│       │   ├── main.yml
│       │   └── mas.yml
│       └── vars
│           └── main.yml
└── update.sh
```

Additional options may be enabled by removing the comment from lines in `roles/vars/main.yml`.