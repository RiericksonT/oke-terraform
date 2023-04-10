data "oci_core_images" "images" {
  compartment_id           = var.comapartment_ocid
  operating_system         = "Oracle Linux"
  operating_system_version = "7.9"
  shape                    = "VM.Standard2.1"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

data "oci_core_images" "images_controller" {
  compartment_id           = var.comapartment_ocid
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "18.04"
  shape                    = "VM.Standard2.1"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}
