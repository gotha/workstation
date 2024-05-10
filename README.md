# Workstation

## Create VM with terraform

```sh
terraform init
terraform apply -var vm_hostname=vm_host
```

### Configure VM

Setup ansible locally and put the VM in `~/.ansible/hosts/inventory.yaml`

```sh
ansible-playbook ./config/ansible/all.yml --extra-vars "hosts=vm_host"
```

or `ssh user@vm_host` into the VM and execute:

```sh
ansible-playbook ~/ansible/all.yml
```

## Manual install from ISO

Install Archlinux following the instructions from [the official guide](https://wiki.archlinux.org/title/installation_guide) and/or use the [cheatsheet](./README-arch.md)


```sh
git clone https://github.com/gotha/workstation.git
cd workstation/config
ansible-playbook ~/ansible/all.yml
```
