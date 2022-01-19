module "subredes_publicas" {
  source               = "../modules/subnet"
  el_id_de_la_VPC      = aws_vpc.mi_red.id
  proyecto             = var.NOMBRE_PROYECTO
  los_az               = var.AV_ZONES
  cantidad_subredes    = var.NRO_DE_SUBREDES
  tipo_subred          = "publica"
  rangos_cidr_subredes = var.CIDR_PUBLICOS_SUBRED
  asigna_ip_publica    = true
}

module "vms_publicas" {
  source               = "../modules/ec2"
  el_id_de_la_VPC      = aws_vpc.mi_red.id
  proyecto             = var.NOMBRE_PROYECTO
  cantidad_instancias  = var.CANTIDAD_INSTANCIAS
  tipo_subred          = "publica"
  los_IDs_subredes     = module.subredes_publicas.IDs_subredes_Forma_1
  ubicacion_public_key = var.RUTA_LLAVE_PUBLICA
  la_aplicacion_1      = "Pagos"
  la_aplicacion_2      = "Compras"
  AZs                  = var.AV_ZONES
  win_server_ami       = var.WIN_SERVER_AMI
  region               = var.REGION
  tipo_instancia       = var.TIPO_INSTANCIA
  instance_username    = var.INSTANCE_USERNAME
  instance_password    = var.INSTANCE_PASSWORD
}

module "alb_balanceador_carga" {
  source           = "../modules/balanceador"
  proyecto         = var.NOMBRE_PROYECTO
  la_aplicacion_1  = "Pagos"
  la_aplicacion_2  = "Compras"
  el_id_de_la_VPC  = aws_vpc.mi_red.id
  los_IDs_subredes = module.subredes_publicas.IDs_subredes_Forma_1
  sec_group_id     = module.vms_publicas.ID_Sec_Group
  id_instancias    = module.vms_publicas.IDs_vms
}