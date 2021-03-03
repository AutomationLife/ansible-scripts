resource "null_resource" "moveFiles" {
  count = var.server
  depends_on = [ aws_instance.k8s_master ]
  provisioner "file" {
    connection {
        type = "ssh"
        user = "ubuntu"
        host = aws_instance.k8s_master[count.index].public_ip
        private_key = file("~/keys/file.pem")
    }
    source = "~/keys/file.pem"
    destination = "~/ansible/kul-labs.pem"
  }

   provisioner "file" {
     connection {
       type = "ssh"
       user = "ubuntu"
       host = aws_instance.k8s_node[count.index].public_ip
       private_key = file("c~/keys/file.pem")
     }
     source = "ansible.cfg"
     destination = "~/ansible/ansible.cfg"
   }
}