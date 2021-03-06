# Coroin Mac Development Environment Provisioning

#### Playbook Options:

This repo contains four options:

- `homeport` : playbook for minimal devenv using Vagrant/VirtualBox/Docker [readme](homeport/readme.md)
- `learn` : playbook created by following [learn](learn/readme.md) steps
- `nodev` : productivity/creativity apps without development tools [readme](nodev/readme.md)
- `valet` : using laravel/valet and locally installed nginx and mariadb [reaadme](valet/readme.md)

#### Setup and Install

0) Clone this repository:

`git clone https://github.com/coroin/macdevenv.git`

1) Copy these files to a local folder:

`sh /PATH/TO/REPO/setup.sh`

If you are running from a USB stick called "MYUSB", the command would be:

`sh /Volumes/MYUSB/macdevenv/setup.sh`

If you cloned the repo to the Downloads folder, the command would be:

`sh ~/Downloads/macdevenv/setup.sh`

The script will create the folder `~/.provision` and copy files there.

2) Change to the provision directory and then the selected option:

`cd ~/.provision/OPTION`

If you want to run the *homeport* install:

`cd ~/.provision/homeport`

If you want to run the *valet* install:

`cd ~/.provision/valet`

If you want to run the *nodev* install:

`cd ~/.provision/nodev`

Note: Alternatively, use the graphical tool Finder.

3)  Modify selected packages/apps:

Make changes to the `vars/main.yml` file located in the `roles/setup` folder and save the file.

4) Run the `install.sh` script for begin installing:

`sh install.sh`

5) Repeat step 3 as needed and then re-run the playbook:

`sh update.sh`

#### TODO

Automate homebrew updates:

```
brew update && brew upgrade && brew cask reinstall `brew cask outdated`
```

Incorporate the following:
- [dotfiles](https://code.tutsplus.com/tutorials/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles--net-35449)
- [fira-code](https://github.com/tonsky/FiraCode)
- [material-theme](https://github.com/equinusocio/material-theme)
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- [php-cs-fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer)
- [sublime-phpunit](https://github.com/adamwathan/sublime-phpunit)
