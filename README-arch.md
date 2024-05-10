# Archlinu manual install

Follow instructions from the [official ArchLinux guide](https://wiki.archlinux.org/title/installation_guide), but basically:

### Partition

View disks:

```sh
fdisk -l
```

Partition disk:

```sh
cfdisk /dev/vda
```

Make filesystem:

```sh
mkfs.ext4 /dev/vda1
```

### Install base system

Mount disk:

```sh
mount /dev/vda1 /mnt
```

strap Arch:

```sh
pacstrap -K /mnt base linux linux-firmware sudo vim grub osprober efibootmgr dhcpcd 
```

### Configure installed system

```sh
arch-chroot /mnt
passwd
```

### Install bootloader 
for legacy systems:

```sh
grub-install --target=i386-pc /dev/vda
```

for UEFI:

```sh
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
```

in both cases configure bootloader:

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

