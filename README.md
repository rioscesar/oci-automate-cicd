# OCI Automate Jenkins Server/Private Docker Registry 

#### *Disclaimer! This is not production level code. Should be treated as a resource on how to automate Jenkins and a Docker Registry on Oracle Cloud Infrastructure. 

## Modify the env.sh file to match your configurations to point to your cloud environment. 

```
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
```
  
## Missing directories:
  * userdata
    - APIkey.pem
    - APIkey_public.pem
    - test_ssh
    - test_ssh.pub

#### The userdata directory contains your APIkey.pem (logs you into your cloud account) as well as your public and private ssh keys you will use to log into your newly created instances. If you need help creating either of these take a look at Oracle's documentation: https://docs.us-phoenix-1.oraclecloud.com/Content/API/Concepts/apisigningkey.htm.
  * Create the APIkey.pem file. 
  * Don't forget to also add your private and public ssh keys into the userdata directory.

###### terraform plan -out=plan.out
###### terraform apply plan.out

#### DESTROY EVERYTHING!

###### terraform destroy ... yes
