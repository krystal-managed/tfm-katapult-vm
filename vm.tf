resource "katapult_ip" "vm" {
  for_each = [for i in range(var.public_ips): format("public_%02d", i + 1)]
}

resource "katapult_virtual_machine" "vm" {
  name          = var.name
  hostname      = var.hostname
  group_id      = var.group_id
  package       = var.package
  disk_template = local.disk_templates[var.disk_template]
  disk_template_options = {
    install_agent = true
  }
  ip_address_ids = local.ip_list

  dynamic "disk" {
    for_each = length(var.disks) > 0 ? var.disks : []
    content {
      name = disk.value.name
      size = disk.value.size
    }
  }
}
