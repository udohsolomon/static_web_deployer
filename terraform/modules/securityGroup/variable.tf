#Variables
variable "access_key" {}
variable "secret_key" {}
variable "region" {
    default = "us-east-1"
}

variable "vpc_id" {
    description = "VPC ID"
    default     = ""
}

variable "environment_tag" {
    description = "Environment_tag"
    default     = ""
}

