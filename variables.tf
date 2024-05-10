variable "disk_img_url" {
  description = "url to archlinux cloud image"
  default     = "https://geo.mirror.pkgbuild.com/images/v20240501.233015/Arch-Linux-x86_64-cloudimg.qcow2"
}

variable "vm_hostname" {
  description = "vm hostname"
  default     = "archy"
}

variable "ssh_username" {
  description = "the ssh user to use"
  default     = "gotha"
}

variable "ssh_private_key" {
  description = "the private key to use"
  default     = "~/.ssh/id_rsa"
}

variable "ssh_public_key" {
  description = "public key to allow access to VM"
  default     = "~/.ssh/id_rsa.pub"
}

