variable "region" {
  description = "AWS Region"
  type        = string
  default     = "sa-east-1"
}

variable "profile" {
  description = "AWS User Profile"
  type        = string
}

variable "ec2_instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "rds_instance_class" {
  description = "Type of RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_db_name" {
  description = "Name of the RDS database"
  type        = string
}
variable "rds_username" {
  description = "Username for the RDS database"
  type        = string
}

variable "rds_password" {
  description = "Password for the RDS database"
  type        = string
}
