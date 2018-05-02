module "vcn" {
  source = "./modules/vcn"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  dns_vcn = "${var.dns_vcn}"
  vcn_display = "${var.vcn_display}"
  vpc-cidr = "${var.vpc-cidr}"
}

module "compute" {
  source = "./modules/compute-instance"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  ssh_public_key = "${var.ssh_public_key}"
  ssh_private_key = "${var.ssh_authorized_private_key}"
  instance_shape = "${var.instance_shape}"
  image_ocid = "${var.image_ocid}"
  subnet = "${module.vcn.subnet2_ocid}"
  name = "${var.compute_name}"
  label = "${var.compute_label}"
  availability_domain = "${module.vcn.subnet2_ad}"
  timeout = "${var.timeout}"
}

module "app-config" {
  source = "./modules/app-config"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  public-ip = "${module.compute.public-ip}"
  ssh_private_key = "${var.ssh_authorized_private_key}"
  instance_user = "${var.instance_user}"
  docker_user = "${var.docker_user}"
  docker_password = "${var.docker_password}"
}

output "Jenkins IP" {
  value = "${module.compute.public-ip}"
}

output "Docker Registry IP" {
  value = "${module.compute.public-ip}:5000"
}

