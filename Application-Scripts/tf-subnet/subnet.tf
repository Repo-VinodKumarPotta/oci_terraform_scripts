resource "oci_core_subnet" "application-subnet" {
  #Required
  cidr_block = "10.0.0.0/24"
  compartment_id = "ocid1.compartment.oc1..aaaaaaaarpcjfdeqyoml4ksojtp7cm57x5b65knmcewzbiuz5wz24c2hdvkq"
  vcn_id = "ocid1.vcn.oc1.ap-hyderabad-1.amaaaaaadlrznpyaikzreqryfscgtnr2gpfk7zxuunehpcddvqu7hkwnjzca"

  #Optional
  #availability_domain = var.subnet_availability_domain
  #defined_tags = {"Operations.CostCenter"= "42"}
  #dhcp_options_id = oci_core_dhcp_options.test_dhcp_options.id
  display_name = "application-subnet"
  #dns_label = var.subnet_dns_label
  #freeform_tags = {"Department"= "OCI"}
  #ipv6cidr_block = var.subnet_ipv6cidr_block
  #prohibit_internet_ingress = false
  #prohibit_public_ip_on_vnic = false
  #route_table_id = oci_core_route_table.test_route_table.id
  #security_list_ids = var.subnet_security_list_ids
}