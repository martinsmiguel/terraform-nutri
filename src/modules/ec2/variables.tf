variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}
}

variable "key_name" {
  type        = string
  description = "Key pair name"
}

variable "securiy_group_id" {
   type        = set(string)
  description = "Security group ID"
}
