resource "null_resource" "setupKubernetesCluster" {
  depends_on = [ null_resource.setupHosts ]
  count = var.server
  provisioner "remote-exec" {
    connection {
        type = "ssh"
        user = "ubuntu"
        host = aws_instance.k8s_master[count.index].public_ip
        private_key = file("~/keys/file.pem")
    }
    inline = [
        "git clone https://github.com/AutomationLife/ansible-scripts.git",
        "cd kubernetes-setup-playbook && ansible-playbook main.yml"
    ]
  }
}