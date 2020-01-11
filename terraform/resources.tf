module "networkModule" {
    source                  = "./modules/network"
        access_key          = "${var.access_key}"
        secret_key          = "${var.secret_key}"
        region              = "${var.region}"
        environment_tag     = "${var.environment_tag}"
}

module "securityGroupModule" {
    source                  = "./modules/securityGroup"
        access_key          = "${var.access_key}"
        secret_key          = "${var.secret_key}"
        region              = "${var.region}"
        vpc_id              = "${module.networkModule.vpc_id}"
        environment_tag     = "${var.environment_tag}"        
}

module "instanceModule" {
    source                  = "./modules/instance"
        access_key          = "${var.access_key}"
        secret_key          = "${var.secret_key}"
        region              = "${var.region}"
        vpc_id              = "${module.networkModule.vpc_id}"
        subnet_public_id    = "${module.networkModule.public_subnets[0]}"
        key_pair_name       = "${module.networkModule.devec2key}"
        security_group_ids  = ["${modules.securityGroupModule.SG_22}", "${modules.securityGroupModule.SG_80}"]
        environment_tag     = "${var.environment_tag}"
}

module "dnskModule" {
    source                  = "./modules/dns"
        access_key          = "${var.access_key}"
        secret_key          = "${var.secret_key}"
        region              = "${var.region}"
        domain_name         = "augeosec.com"
        aRecords            = ["augeosec.com ${module.instanceModule.instance_eip}"]
        cnameRecords        = ["www.augeosec.com augeosec.com"]
        environment_tag     = "${var.environment_tag}"
}