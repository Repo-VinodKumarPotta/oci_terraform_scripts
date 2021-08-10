#https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/bastion_session
#terraform Allow group SecurityAdmins to manage bastion-family in tenancy
#terraform Allow group SecurityAdmins to manage virtual-network-family in tenancy
#terraform Allow group SecurityAdmins to read instance-family in tenancy
#terraform Allow group SecurityAdmins to read instance-agent-plugins in tenancy
#terraform Allow group SecurityAdmins to inspect work-requests in tenancy

variable "session_key_details_public_key_content" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8FIWLH54+3BdIBRogCycV+aRBxQr+sb5JXojFRTddCBhvUsZm3+nGqY2i0WnlQbmYSdGH4ehNTZgwdwPQ3WpnO8Vhe3I2iytnVa9a53N/r4Z+bDP9gDtdg7AhPximoylBteMQZlRDGClH1F2iWF0KY5honxhnYlCz5Yle+gKKlrdzoxpIphYw8oiNKur5LVlqsSoGOSRF5oa9qIptMFBQmou3hfn7MewM/W7E7BiIg5HDXUV6ZMFdNXSkIQ7aoH/Zcu1CxIZsOGR4+qdPFRQJQp5azhBJTLg7Wz06sismunSD0x3oku10UxIl6w/h1jVbG6uGg2gwjIogl4zS3aod oci-sshkey-1"
}

variable "session_key_type" {
  default = "PUB"
}

variable "session_session_lifecycle_state" {
  default = "ACTIVE"
}

variable "session_session_ttl_in_seconds" {
  default = 1800
}

variable "session_target_resource_details_session_type_managed_ssh" {
  default = "MANAGED_SSH"
}

variable "bastion_bastion_lifecycle_state" {
  default = "ACTIVE"
}

variable "bastion_client_cidr_block_allow_list" {
  default = ["0.0.0.0/0"]
}

variable "bastion_defined_tags_value" {
  default = "value"
}

variable "bastion_name" {
  default = "bastionExample"
}

variable "bastion_freeform_tags" {
  default = {
    "bar-key" = "bastion_test"
  }
}

variable "bastion_max_session_ttl_in_seconds" {
  default = 1800
}

variable "session_target_resource_details_target_resource_port" {
  default = 22
}

resource "oci_bastion_session" "test_session" {
  #Required
  bastion_id = oci_bastion_bastion.test_bastion.id
  key_details {
    #Required
    public_key_content = var.session_key_details_public_key_content
  }
  target_resource_details {
    #Required
    session_type = "MANAGED_SSH"
    target_resource_id = "ocid1.instanceconsoleconnection.oc1.ap-hyderabad-1.anuhsljrdlrznpycbcuekt3rbn2pfsl2by7oetfpxgsdi54zkt4ar2sazkhq"
    target_resource_port                       = var.session_target_resource_details_target_resource_port
    target_resource_private_ip_address         = "172.168.0.5"
  }

  #Optional
  display_name           = "test_session"
  key_type               = var.session_key_type
  session_ttl_in_seconds = var.session_session_ttl_in_seconds
}

resource "oci_bastion_bastion" "test_bastion" {
  #Required
  bastion_type = "STANDARD"
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaropz4m2qnoxajusx3tynuo2jqde3srph3faksnafc5q7tco5ujkq"
  target_subnet_id = "ocid1.subnet.oc1.ap-hyderabad-1.aaaaaaaazptxptmjacsn53kr6wgkzuiebds7im2mclaxbv4borlkgjta3oba"

  #Optional
  client_cidr_block_allow_list = var.bastion_client_cidr_block_allow_list
  name                         = var.bastion_name
  freeform_tags                = var.bastion_freeform_tags
  max_session_ttl_in_seconds   = var.bastion_max_session_ttl_in_seconds
}