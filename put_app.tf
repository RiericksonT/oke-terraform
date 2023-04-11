resource "null_resource" "app" {
  depends_on = [
    oci_containerengine_cluster.oke-cluster
  ]
  provisioner "local-exec" {
    command = "sudo kubectl apply -R -f ~/app/microservice-app-example"
  }
}
