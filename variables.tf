variable "region" {
    type = string
    default = "ap-south-1"
}

variable "custom_vpc_name" {
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "app_instance_name" {
  description = "Name of the application instance"
  type        = string
  default     = "app"
}
variable "db_instance_name" {
  description = "Name of the database instance"
  type        = string
  default     = "db"
}
variable "user_data_path_app" {
  description = "Path to user data script for app instance"
  type        = string
  default     = "python.sh"
}
variable "user_data_path_db" {
  description = "Path to user data script for db instance"
  type        = string
  default     = "postgres.sh"
}

variable "bastion_instance_name" {
  description = "Name of the bastion instance"
  type        = string
  default     = "bastion"
}
variable "elastic_ip" {
  type        = string
}

variable "main_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "private_subnet_cidr" {
  type    = list(string)
  default = ["10.0.3.0/24"]
}

