output "El_ID_VPC" { value = aws_vpc.mi_red.id }
output "Router_Nuevo_ID_VPC" { value = aws_vpc.mi_red.main_route_table_id }

output "IDs_subredes_SPLASH" {
  value = module.subredes_publicas.IDs_subredes_Forma_1
}
output "IDs_subredes_SPLASH_2" {
  value = module.subredes_publicas.IDs_subredes_Forma_2
}
output "IDs_subredes_FOR_IN" {
  value = module.subredes_publicas.IDs_subredes_Forma_3
}
output "IDs_subredes_FOR_RANGE" {
  value = module.subredes_publicas.IDs_subredes_Forma_4
}

output "IP_privada_de_EC2_en_subred_publica" { value = module.vms_publicas.mis_ip_privadas }
output "IP_publica_de_EC2_en_subred_publica" { value = module.vms_publicas.mis_ip_publicas }

output "Subredes" { value = module.subredes_publicas.Rango_de_IPs_Subred }
