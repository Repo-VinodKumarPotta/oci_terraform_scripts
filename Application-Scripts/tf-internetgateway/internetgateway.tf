
resource "oci_core_internet_gateway" "application-internetgateway" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaarpcjfdeqyoml4ksojtp7cm57x5b65knmcewzbiuz5wz24c2hdvkq"
  display_name   = "application-internetgateway"
  vcn_id         = "ocid1.vcn.oc1.ap-hyderabad-1.amaaaaaadlrznpyawr4a4gn7z6h75w3o4cx5qdfzyz5rpnmd54wolv55x4ua"
}

