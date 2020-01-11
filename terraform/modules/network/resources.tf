provider "aws" {
    access_key              = "${var.access_key}"
    secret_key              = "${var.secret_key}"
    region                  = "${var.region}"
}

#Resources
resource "aws_vpc" "vpc" {
    cidr_block              = "${var.cidr_block_range}"
    enable_dns_support      = True
    enable_dns_hostnames    = True
    tags {
        "Environment"       = "${var.envronment_tag}"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id                  = "${aws_vpc.vpc_id}"
    tags {
        "Environment"       = "${var.envronment_tag}"
    }
}

resource "aws_subnet" "subnet_public" {
    vpc_id                  = "${aws_vpc.vpc_id}"
    cidr_block              = "${var.subnet1_cidr_block_range}"
    map_public_ip_on_launch = True
    availability_zone       = "${var.availability_zone}"
    tags {
        "Environment"       = "${var.envronment_tag}"
        "Type"              = "Public"
    }
}

resource "aws_route_table" "route_table_public" {
    vpc_id                  = "${aws_vpc.vpc_id}"
    route {
        cidr_block          = "0.0.0.0/0"
        gateway_id          = "${aws_internet_gateway.igw.id}"
    }
    tags {
        "Environment"       = "${var.envronment_tag}"
    }
}

resource "aws_route_table_association" "rta_subnet_public" {
    subnet_id               = "${aws_subnet.subnet_public.id}"
    route_table_id          = "${aws_route_table.rtb_public.id}"

}

resource "aws_key_pair" "ec2key" {
    key_name                = "devec2key"
    public_key              = "${file(var.public_key_path)}"
}