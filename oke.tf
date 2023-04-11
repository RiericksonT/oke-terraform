data "oci_containerengine_cluster_kube_config" "cluster_kube_config" {
  cluster_id = oci_containerengine_cluster.oke-cluster.id
  expiration = 2592000
}

resource "local_file" "cluster_kube_config_file" {
  content  = data.oci_containerengine_cluster_kube_config.cluster_kube_config.content
  filename = "config"

  provisioner "local-exec" {
    command = "export KUBECONFIG=${path.module}/config"
  }
}

resource "oci_containerengine_cluster" "oke-cluster" {
  compartment_id     = var.comapartment_ocid
  name               = "oke-cluster"
  vcn_id             = oci_core_virtual_network.vcn.id
  kubernetes_version = "v1.25.4"

  options {
    add_ons {
      is_kubernetes_dashboard_enabled = false
      is_tiller_enabled               = false
    }
    kubernetes_network_config {
      pods_cidr     = "10.244.0.0/16"
      services_cidr = "10.96.0.0/16"
    }
    service_lb_subnet_ids = [oci_core_subnet.subnet-cluster.id]
  }
}
