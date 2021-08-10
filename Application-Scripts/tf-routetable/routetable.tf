resource "oci_core_route_table" "routetable1" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaarpcjfdeqyoml4ksojtp7cm57x5b65knmcewzbiuz5wz24c2hdvkq"
  vcn_id         = "ocid1.vcn.oc1.ap-hyderabad-1.amaaaaaadlrznpyaikzreqryfscgtnr2gpfk7zxuunehpcddvqu7hkwnjzca"
  display_name   = "application-routetable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "ocid1.internetgateway.oc1.ap-hyderabad-1.aaaaaaaao2azz6cyydw6hiduee22any5pwvq3hnyy6wq4f76vyeb2kwa7ccq"
  }
}