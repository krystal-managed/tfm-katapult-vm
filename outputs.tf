output "vm_id" {
  value = katapult_virtual_machine.vm.id
  description = "VM ID Output"
}

output "ip_ids" {
  value = local.ip_list
  description = "IP IDs List"
}
