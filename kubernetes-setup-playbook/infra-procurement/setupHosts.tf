resource "null_resource" "setupHosts" {
  count = var.server
  depends_on = [ aws_instance.k8s_master,aws_instance.k8s_node ]
  provisioner "remote-exec" {
    connection {
        type = "ssh"
        user = "ubuntu"
        host = aws_instance.k8s_master[count.index].public_ip
        private_key = file("~/keys/file.pem")
    }
    inline = [
        "echo '[master]' > ~/ansible/hosts",
        "echo '${aws_instance.k8s_master[count.index].private_ip}' >> ~/ansible/hosts",
        "echo '[nodes]' >> ~/ansible/hosts",
        "echo '${aws_instance.k8s_node[count.index].private_ip}' >> ~/ansible/hosts"
    ]
  }
}