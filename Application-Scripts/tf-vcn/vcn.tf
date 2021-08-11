resource "oci_core_vcn" "vcn-application" {
  #Required
  compartment_id = "ocid1.compartment.oc1..aaaaaaaarpcjfdeqyoml4ksojtp7cm57x5b65knmcewzbiuz5wz24c2hdvkq"

  #Optional
  cidr_block = "10.0.0.0/24"
  #cidr_blocks = var.vcn_cidr_blocks
  #defined_tags = {"Operations.CostCenter"= "42"}
  display_name = "vcn-application"
  dns_label = "vcnapplication"
  #freeform_tags = {"Department"= "vcn-1"}
}