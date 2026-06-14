# AWS Configuration
aws_region = "us-east-1"

# EKS Cluster Configuration
cluster_name    = "prod"
cluster_version = "1.33"

# Node Group Configuration
node_group_min_size     = 2
node_group_max_size     = 5
node_group_desired_size = 2
node_instance_types     = ["t3.medium"]
node_disk_size          = 50

# Environment Variables
environment = "prod"

db_password = "REPLACE_WITH_SECURE_PASSWORD"

# Tags
tags = {
  Environment = "prod"
  ManagedBy   = "Terraform"
  Project     = "Infrastructure"
}
