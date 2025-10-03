module "sg" {
  count = var.create_sg ? 1 : 0

  source = "https://github.com/krystal-managed/tfm-katapult-security-group.git"

  name   = var.name
  vm_ids = [katapult_virtual_machine.vm.id]

  enable_web     = var.enable_web
  enable_krystal = var.enable_krystal
  enable_zabbix  = var.enable_zabbix

  rules_in  = var.rules_in
  rules_out = var.rules_out
}