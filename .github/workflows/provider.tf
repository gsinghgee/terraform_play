# define remote state file for terraform
terraform {
  required_version = ">= 1.0.0"
  }

# define the terraform provider 
  provider "oci" {
    tenancy_ocid      =  var.tenancy_ocid 
    user_ocid         =  var.user_ocid
    fingerprint       =  var.fingerprint
    private_key_path  =  var.private_key_path
    region            =  var.region
  }

  # ----- EOF------
  
