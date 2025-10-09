output "vm_id" {
  value = katapult_virtual_machine.vm.id
}
output "vm_ips" {
  value = katapult_ip.ip[*].address
}
output "sg_id" {
  value = var.create_sg ? module.sg[0].sg_id : null
}
