resource "katapult_ip" "vm" {
  count = var.public_ips
}

resource "katapult_virtual_machine" "vm" {
  name          = var.name
  hostname      = var.name
  group_id      = var.group_id != "" ? var.group_id : null
  package       = var.package
  disk_template = local.disk_templates[var.disk_template]
  disk_template_options = {
    install_agent = true
  }
  ip_address_ids = katapult_ip.vm[*].id

  dynamic "disk" {
    for_each = length(var.disks) > 0 ? var.disks : []
    content {
      name = disk.value.name
      size = disk.value.size
    }
  }

}
