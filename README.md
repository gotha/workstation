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

Install Archlinux following the instructions from [the official guide](https://wiki.archlinux.org/title/installation_guide) and/or use the [cheatsheet](./README-arch.md)

```sh
git clone https://github.com/gotha/workstation.git
ansible-playbook ./workstation/config/ansible/all.yml
```
