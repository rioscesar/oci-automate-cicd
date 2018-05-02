############################# User Configuration ####################################

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "ssh_public_key" {}
variable "ssh_authorized_private_key" {}
variable "compartment_ocid" {}
variable "docker_user" {}
variable "docker_password" {}

############################### Compute Configuration #################################

variable "compute_name" {
  default="Jenkins/Docker-Registry"
}
variable "compute_label" {
  default="jd-instance"
}
variable "instance_shape" {
  default="VM.Standard1.2"
}
variable "image_ocid" {
  default="ocid1.image.oc1.iad.aaaaaaaafrubf4l6e456z4mqn3bj5dpv3s6czfjmyt2m3ukkugzzaosz2fnq"
}
variable "instance_user" {
  default="opc" 
}
variable "timeout" {
  default="60m" 
}

############################ VCN Configuration #######################################

variable "dns_vcn" {
  default="tfvcn"
}
variable "oraclevcn" {
  default="oraclevcn.com"
}
variable "vcn_display" {
  default="JDVCN"
}
variable "vpc-cidr" {
  default = "10.0.0.0/16"
}

