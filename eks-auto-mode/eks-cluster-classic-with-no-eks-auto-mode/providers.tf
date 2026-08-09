provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "eks-auto-mode-lab"
      Environment = "lab"
      ManagedBy   = "Terraform"
    }
  }
}