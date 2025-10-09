output "vm_id" {
  value = katapult_virtual_machine.vm.id
}
output "sg_id" {
  value = module.sg[0].sg_id
}
output "vm_ips" {
  value = katapult_ip.ip[*].address
}
