# Coroin LocalDev Setup Guide for Laravel Valet using Ansible

This script automates the install of a Mac localdev environment using [ansible](https://www.ansible.com/) to setup [laravel/valet](https://laravel.com/docs/5.4/valet).

This is similar to the [learn](/learn/readme.md) single-file playbook with a more traditional ansible project structure:

```
valet/
├── install.sh
├── playbook.yml
├── readme.md
├── roles
│   └── setup
│       ├── handlers
│       │   └── main.yml
│       ├── tasks
│       │   ├── composer.yml
│       │   ├── homebrew.yml
│       │   ├── macdock.yml
│       │   ├── main.yml
│       │   ├── mas.yml
│       │   ├── packages.yml
│       │   └── valet.yml
│       └── vars
│           └── main.yml
└── update.sh
```

It includes two tasks that are disabled by default:
- `macdock.yml` : re-configure the mac dock
- `mas.yml` : install applications from apple store