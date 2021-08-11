resource "oci_core_subnet" "bastion-subnet" {
  #Required
  cidr_block = "172.168.0.0/29"
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaropz4m2qnoxajusx3tynuo2jqde3srph3faksnafc5q7tco5ujkq"
  vcn_id = "ocid1.vcn.oc1.ap-hyderabad-1.amaaaaaadlrznpyazeczgpefd42qkqbawespfkzthsewpf6d6wtbk3hpnsta"

  #Optional
  #availability_domain = var.subnet_availability_domain
  #defined_tags = {"Operations.CostCenter"= "42"}
  #dhcp_options_id = oci_core_dhcp_options.test_dhcp_options.id
  display_name = "bastion-subnet"
  dns_label = "bastionsubnet"
  #freeform_tags = {"Department"= "OCI"}
  #ipv6cidr_block = var.subnet_ipv6cidr_block
  prohibit_internet_ingress = false
  prohibit_public_ip_on_vnic = false
  #route_table_id = oci_core_route_table.test_route_table.id
  #security_list_ids = var.subnet_security_list_ids
}