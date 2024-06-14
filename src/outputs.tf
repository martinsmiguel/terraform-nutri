output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "s3_bucket_arn" {
  value = module.s3_bucket.bucket_arn
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "rds_endpoint" {
  value = module.rds.db_instance_endpoint
}
