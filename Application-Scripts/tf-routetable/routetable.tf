resource "oci_core_route_table" "application-routetable" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaarpcjfdeqyoml4ksojtp7cm57x5b65knmcewzbiuz5wz24c2hdvkq"
  vcn_id         = "ocid1.vcn.oc1.ap-hyderabad-1.amaaaaaadlrznpyawr4a4gn7z6h75w3o4cx5qdfzyz5rpnmd54wolv55x4ua"
  display_name   = "application-routetable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "ocid1.internetgateway.oc1.ap-hyderabad-1.aaaaaaaan5l7oitfsjsuwihlyadhshyyq5gahmked726h2jrurxexpebep2a"
  }
}