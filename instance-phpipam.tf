
resource "scaleway_instance_ip" "public_ip" {
}

resource "scaleway_instance_server" "web" {
type = "DEV1-S"
image = "ubuntu_focal"
tags = ["front", "web"]
ip_id = scaleway_instance_ip.public_ip.id
root_volume {}

provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "root"
      private_key = file(var.pvt_key)
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.public_ip},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' provision.yml"
  }

}

