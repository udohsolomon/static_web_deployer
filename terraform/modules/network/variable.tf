#Variables

variable "access_key" {}
variable "secret_key" {}
variable "region" {
    default     = "us-east-1"
}
variable "availability_zone" {
    default     = "us-east-1a"
}
variable "cidr_block_range" {
    description = "The CIDR block for public subnet of VPC"
    default     = "10.0.1.0/16"
}
variable "subnet1_cidr_block_range" {
    description = "The CIDR block for public subnet of VPC
    default     = "10.0.1.0/24"
}
variable "subnet2_cidr_block_range" {
    description = "The CIDR block for private subnet of VPC
    default     = "10.0.2.0/24"
}
variable "environment_tag" {
    description = "Environment tag"
    default     = ""
}
variable "public_key_path" {
    description = "Public key path"
    default     = "~/.ssh/id_rsa.pub"
}