resource "oci_containerengine_node_pool" "nodepool_oke" {
  cluster_id         = oci_containerengine_cluster.oke-cluster.id
  compartment_id     = var.comapartment_ocid
  kubernetes_version = "v1.25.4"
  name               = "pool-1"
  node_config_details {
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
      subnet_id           = oci_core_subnet.subnet-nodepool.id
    }
    size = 3
  }
  node_shape = "VM.Standard2.1"
  node_source_details {
    source_type = "IMAGE"
    image_id    = data.oci_core_images.images.images[0].id
  }

  initial_node_labels {
    key   = "key1"
    value = oci_containerengine_cluster.oke-cluster.name
  }
}
