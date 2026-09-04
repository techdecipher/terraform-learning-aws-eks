# Variables for EKS cluster

variable "cluster_name" {
    description = "Name of EKS cluster"
    type = string
    default = "eks_techdecipher_labs"
  
}

variable "cluster_service_ipv4_cidr" {
    description = "service IPv4 CIDR block for the EKS cluster"
    type = string
    default = null
}

variable "cluster_version" {
    description = "Kubernetes version for the EKS cluster"
    type = string
    default = "1.35"
}

variable "cluster_endpoint_private_access" {
    description = "Whether the EKS cluster endpoint is accessible privately"
    type = bool
    default = false
}

variable "cluster_endpoint_public_access" {
    description = "Whether the EKS cluster endpoint is accessible publicly"
    type = bool
    default = true
}

variable "cluster_endpoint_public_access_cidrs" {
    description = "List of CIDR blocks that are allowed access to the EKS cluster endpoint"
    type = list(string)
    default = ["0.0.0.0/0"]
}