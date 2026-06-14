module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = false

  # Network configuration
  vpc_id     = aws_vpc.main.id
  subnet_ids = aws_subnet.private[*].id

  # EKS managed node group
  eks_managed_node_groups = {
    default = {
      name         = "${var.cluster_name}-node-group"
      min_size     = var.node_group_min_size
      max_size     = var.node_group_max_size
      desired_size = var.node_group_desired_size

      instance_types = var.node_instance_types
      disk_size      = var.node_disk_size

      labels = {
        Environment = var.environment
      }

      tags = merge(
        var.tags,
        {
          Name = "${var.cluster_name}-nodes"
        }
      )
    }
  }

  # Tags
  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_name}-cluster"
    }
  )
}
