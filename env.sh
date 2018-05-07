###################### Environment Setup  ####################################3

export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1.xxx"
#Enter Your Compartment OCID
export TF_VAR_compartment_ocid="ocid1.compartment.oc1..aaxxx"
#Enter Your User OCID
export TF_VAR_user_ocid="ocid1.user.oc1..aaaaaaaacnlcisahxxx"
#Enter Your Fingerprint
export TF_VAR_fingerprint="fb:93:b0:6c:ac:f2:42xxx"
#Enter Your Region
export TF_VAR_region="us-ashburn-1"

#Change following fields to point to correct keys
export TF_VAR_private_key_path="userdata/eshneken-bmcs.pem"
export TF_VAR_ssh_public_key_path="userdata/eshneken-opc.pub"
export TF_VAR_ssh_public_key=$(cat userdata/eshneken-opc.pub)
export TF_VAR_ssh_authorized_private_key=$(cat userdata/eshneken-opc)

export TF_VAR_docker_user="demouser"
export TF_VAR_docker_password=""
