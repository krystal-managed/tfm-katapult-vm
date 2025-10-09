data "katapult_disk_templates" "all" {}

locals {
  disk_templates = zipmap(data.katapult_disk_templates.all.templates[*].name, data.katapult_disk_templates.all.templates[*].permalink)

  ip_list = [ for each in katapult_ip.vm : each.value.id ]
}
