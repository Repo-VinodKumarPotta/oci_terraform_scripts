# Outputs for compartment

output "compartment-name" {
  value = oci_identity_compartment.tf-compartment-2.name
}

output "compartment-OCID" {
  value = oci_identity_compartment.tf-compartment-2.id
}