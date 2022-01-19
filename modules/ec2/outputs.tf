output "mis_ip_privadas" { value = aws_instance.mis_vms.*.private_ip }
output "mis_ip_publicas" { value = aws_instance.mis_vms.*.public_ip }

output "IDs_vms" { value = aws_instance.mis_vms.*.id }

output "ID_Sec_Group" { value = aws_security_group.mi_sec_group.id }



