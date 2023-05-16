resource "oci_core_instance" "Controller" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.comapartment_ocid
  shape               = "VM.Standard2.1"
  source_details {
    source_id   = data.oci_core_images.images_controller.images[0].id
    source_type = "image"
  }

  # Optional
  display_name = "Controller"
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.subnet-cluster.id
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_file)
  }
  preserve_boot_volume = false

}

