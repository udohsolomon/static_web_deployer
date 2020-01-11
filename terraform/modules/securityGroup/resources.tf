provider "aws" {
    access_key      = "${var.access_key}"
    secret_key      = "${var.secret_key}"
    region          = "${var.region}"
}

resource "aws_security_group" "SG_22" {
    name            = "${SG_22}"
    vpc_id          = "${var.vpc_id}"

    #SSH access fro0m the VPC 
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0]
    }
    tags {
        "Environmrnt"= "${var.environmrnt_tag}"
    }
}

resource "aws_security_group" "SG_80" {
    name            = "${SG_80}"
    vpc_id          = "${var.vpc_id}"

    #SSH access fro0m the VPC 
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0]
    }
    tags {
        "Environmrnt"= "${var.environmrnt_tag}"
    }
}
