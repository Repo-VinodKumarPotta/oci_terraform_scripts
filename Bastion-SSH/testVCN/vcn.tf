resource "oci_core_vcn" "vcn-bastion-2" {
  #Required
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaropz4m2qnoxajusx3tynuo2jqde3srph3faksnafc5q7tco5ujkq"

  #Optional
  cidr_block = "172.168.0.0/29"
  #cidr_blocks = var.vcn_cidr_blocks
  #defined_tags = {"Operations.CostCenter"= "42"}
  display_name = "vcn-bastion-2"
  dns_label = "vcnbastion2.oraclevcn.com"
  #freeform_tags = {"Department"= "vcn-1"}
}