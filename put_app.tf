resource "null_resource" "run_ansible" {
  depends_on = [
    oci_core_instance.Controller,
  ]
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update"
    ]
    connection {
      type        = "ssh"
      host        = oci_core_instance.Controller.public_ip
      user        = "ubuntu"
      private_key = file(var.ssh_private_key_file)
      timeout     = "5m"
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${oci_core_instance.Controller.public_ip}, -u ubuntu --private-key ${var.ssh_private_key_file} ${path.module}install_docker.yml"
  }
}
