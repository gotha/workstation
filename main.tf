provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_volume" "base" {
  name   = "base"
  pool   = "default"
  source = var.disk_img_url
  format = "qcow2"
}

resource "libvirt_volume" "root" {
  name           = "${var.vm_hostname}-root"
  pool           = "default"
  base_volume_id = libvirt_volume.base.id
  size           = 50 * 1024 * 1024 * 1024 #50GB
}

data "template_file" "user_data" {
  template = file("${path.module}/config/cloud_init.yml")
  vars = {
    ssh_username   = var.ssh_username
    ssh_public_key = file(var.ssh_public_key)
  }
}

data "template_file" "network_config" {
  template = file("${path.module}/config/network_config.yml")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "${var.vm_hostname}-init.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = "default"
}

resource "libvirt_domain" "domain" {
  name      = var.vm_hostname
  memory    = "8192"
  vcpu      = 4
  autostart = true

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_name   = "default"
    wait_for_lease = true
    hostname       = var.vm_hostname
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.root.id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello World'"
    ]

    connection {
      type        = "ssh"
      user        = var.ssh_username
      host        = libvirt_domain.domain.network_interface[0].addresses[0]
      private_key = file(var.ssh_private_key)
      timeout     = "5m"
    }
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "local-exec command"
      EOT
  }
}


