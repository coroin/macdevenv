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

#### Step 4 - Create ansible playbook

This is the command to add to our install script:

`ansible-playbook -i ../hosts playbook.yml -vv`

It references the `hosts` file to tell ansible we are provisioning the localhost:

```
[mac]
localhost ansible_connection=local
```

Note: the `hosts` file is located one directory up in this repo because it is shared by all playbooks/scripts.

---

Create `playbook.yml` with our first instruction:

```
---

- hosts: mac

  tasks:
  - name: install apps via hombrew
    homebrew:
      name: git
      state: latest
```

#### Step 5 - Install multiple items using homebrew

Using the `with_items` syntax, we can install multiple items with a single command:

```
  - name: install apps via hombrew
    homebrew:
      name: "{{ item }}"
      state: latest
    with_items:
      - git
      - openssl
      - wget
```

Note: We will also create an `update.sh` script so we can re-run our ansible playbook.

#### Step 6 - Install apps using homebrew cask

Some homebrew items are installed using "casks":

```
  - name: install apps via homebrew cask
    homebrew_cask:
      name: iterm2
      state: installed
```

#### Step 7 - Install homebrew taps

Homebrew formulae can also come from external sources called taps:

```
  - name: install hombrew taps
    homebrew_tap:
      name: "{{ item }}"
      state: present
    with_items:
      - homebrew/homebrew-php
```

#### Step 8 - Install all homebrew items for localdev

Here is the full list of items to install from homebrew, including php7 (via homebrew tap):

```
  - name: install hombrew taps
    homebrew_tap:
      name: "{{ item }}"
      state: present
    with_items:
      - homebrew/homebrew-php

  - name: install apps via hombrew
    homebrew:
      name: "{{ item }}"
      state: latest
    with_items:
      - bash-git-prompt
      - coreutils
      - curl
      - findutils
      - git
      - mariadb
      - openssl
      - php71
      - wget

  - name: install apps via homebrew cask
    homebrew_cask:
      name: "{{ item }}"
      state: installed
    with_items:
      - google-chrome
      - iterm2
      - sublime-text
```

Note: run homebrew_tap before homebrew because "php71" comes from the "homebrew-php" tap.

#### Step 9 - Install composer

```
  - name: download composer
    get_url:
      url: https://getcomposer.org/installer
      dest: /tmp/installer

  - name: install composer
    shell: cat /tmp/installer | php -- --install-dir=/usr/local/bin
    args:
      creates: /usr/local/bin/composer

  - name: rename composer.phar to composer
    shell: mv /usr/local/bin/composer.phar /usr/local/bin/composer
    args:
      creates: /usr/local/bin/composer

  - name: make composer executable
    file:
      path: /usr/local/bin/composer
      mode: a+x
      state: file

  - name: add composer bin to path
    lineinfile:
      path: '$HOME/.bash_profile'
      create: yes
      line: 'export PATH="$PATH:$HOME/.composer/vendor/bin"'
```