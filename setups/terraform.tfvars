REGION          = "eu-west-3"
BLOQUE_CIDR_VPC = "10.0.0.0/16"
NOMBRE_PROYECTO = "entelApp"

NRO_DE_SUBREDES = 4
AV_ZONES        = ["eu-west-3a", "eu-west-3b", "eu-west-3c", "eu-west-3a"]
# CIDR_PRIVADOS_SUBRED = ["10.0.20.0/24", "10.0.30.0/24", "10.0.40.0/24", "10.0.50.0/24"]
CIDR_PUBLICOS_SUBRED = ["10.0.100.0/24", "10.0.150.0/24", "10.0.200.0/24", "10.0.250.0/24"]

CANTIDAD_INSTANCIAS = 4
TIPO_INSTANCIA      = "t2.small"
INSTANCE_USERNAME   = "vincent"
INSTANCE_PASSWORD   = "Password!1234"
WIN_SERVER_AMI = {
  us-east-1 = "ami-04505e74c0741db8d", # Ubuntu 20.04 (Virginia)
  us-west-1 = "ami-01f87c43e618bf8f0", # Ubuntu 20.04 (California)
  eu-west-3 = "ami-0c6ebbd55ab05f070"  # Ubuntu 20.04 (Paris)
}

RUTA_LLAVE_PUBLICA = "C:/Users/jvinc/.ssh/id_rsa.pub"