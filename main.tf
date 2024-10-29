module "networking-module" {
  source          = "./networking-module"
  vpc_cidr        = "192.168.0.0/16"
  frontend_1_name = var.frontend-1-name
  frontend_2_name = var.frontend-2-name
  backend_1_name  = var.backend-1-name
  backend_2_name  = var.backend-2-name
}