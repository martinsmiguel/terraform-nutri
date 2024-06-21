variable "db_instance_class" {
  description = "Instance class for RDS"
  type        = string
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "username" {
  description = "Username for the RDS database"
  type        = string
}

variable "password" {
  description = "Password for the RDS database"
  type        = string
}



variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}
}

variable "subnet_group_name" {
  description = "Subnet group name for the RDS database"
  type        = string
}
