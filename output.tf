output "ip" {
  value = libvirt_domain.domain.network_interface[0].addresses[0]
}

output "cloud_init" {
  value = data.template_file.user_data.rendered
}

