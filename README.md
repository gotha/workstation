# Workstation

Setup ArchLinux install for every day work (uses sway, rofi, waybar for UI).

Comes in VM and bare metal install variants thanks to ansible playbooks.

Uses [dotfiles](https://github.com/gotha/dotfiles)

## Create VM with terraform

```sh
terraform init
terraform apply -var vm_hostname=vm_host
```

## Manual install from ISO

Boot from install ISO.

Download install configuration file:

```sh
curl https://raw.githubusercontent.com/gotha/workstation/main/config/archinstall/user_configuration.json > /tmp/user_configuration.json
archinstall --config /tmp/user_configuration.json
```

Setup disk partitioning (and user if you need to), finish the installation and restart.

```sh
git clone https://github.com/gotha/workstation.git
ansible-playbook ./workstation/config/ansible/all.yml
```

Set default shell to zsh (note: .zprofile is used to start sway):

```sh
chsh -s /usr/bin/zsh gotha
```
