resource "oci_core_instance" "bastion-compute-instance" {
  # Required
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaropz4m2qnoxajusx3tynuo2jqde3srph3faksnafc5q7tco5ujkq"
  shape = "VM.Standard.E2.1"
  source_details {
    source_id = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaa547rmkpmvfcogqrv3oigfoodqmifton3phvl3q5cormdy43wxz4q"
    source_type = "image"
  }

  # Optional
  display_name = "bastion-compute"
  create_vnic_details {
    assign_public_ip = true
    subnet_id = "ocid1.subnet.oc1.ap-hyderabad-1.aaaaaaaazptxptmjacsn53kr6wgkzuiebds7im2mclaxbv4borlkgjta3oba"
  }
  metadata = {
    ssh_authorized_keys = file("/Volumes/VinodKumarPotta/Study/Terraform/OCI_Terraform_Script/Terraform/OCI_Scripts/ssh-keys/oci-sshkey-1.pub")
  }
  preserve_boot_volume = false
}