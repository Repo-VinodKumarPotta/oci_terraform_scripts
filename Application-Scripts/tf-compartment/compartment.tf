resource "oci_identity_compartment" "tf-compartment-2" {
  # Required
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaaxyeg4tmhgqrtlrl7ztz3npxpow5s6nf7onn3fucgpxwu6vyyaljq"
  description = "Compartment for Terraform resources."
  name = "application-compartment"
}
