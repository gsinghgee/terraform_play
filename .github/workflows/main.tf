/*
# main.tf
locals {
  cmpt_name_prefix = "T117"
  time_f           = formatdate("HHmmss", timestamp())
}

############################################
# Compartments
############################################
resource "oci_identity_compartment" "example_compartment" {
  # Required
  compartment_id = var.compartment_id
  description    = var.compartment_description
  name           = "${local.cmpt_name_prefix}-${var.compartment_name}-${local.time_f}"
}


# ############################################
# # Compute Instance
# ############################################

resource "oci_core_instance" "ic_pub_vm-A" {
  compartment_id      = oci_identity_compartment.example_compartment.id
  shape               = var.ic_pub_vm_A.shape.name
  availability_domain = var.ic_pub_vm_A.availability_domain
  display_name        = var.ic_pub_vm_A.display_name

  source_details {
    source_id   = var.ic_pub_vm_A.image_ocid
    source_type = "image"
  }

  dynamic "shape_config" {
    for_each = [true]
    content {
      #Optional
      memory_in_gbs = var.ic_pub_vm_A.shape.memory_in_gbs
      ocpus         = var.ic_pub_vm_A.shape.ocpus
    }
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnetA_pub.id
    assign_public_ip = var.ic_pub_vm_A.assign_public_ip
  }

  metadata = {
    ssh_authorized_keys = join("\n", [for k in var.ic_pub_vm_A.ssh_authorized_keys : chomp(k)])
  }
}
*/
