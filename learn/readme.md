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