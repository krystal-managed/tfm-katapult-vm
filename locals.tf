data "katapult_disk_templates" "all" {}
locals {
  disk_templates = zipmap(data.katapult_disk_templates.all.templates[*].name, data.katapult_disk_templates.all.templates[*].id)
}