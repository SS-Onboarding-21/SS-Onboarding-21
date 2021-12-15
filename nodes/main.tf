

// instances

resource "google_compute_instance" "ubuntu-nodes" {

  count = var.nodes_count

  name = "node-${count.index}"

  machine_type = var.node-machine_type

  boot_disk {
    initialize_params {
      image = var.ubuntu-boot_disk_image
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata = {
    ssh-keys = "kateryna:${file("C:\\Users\\katya/.ssh/id_rsa.pub")}"
  }

  lifecycle {
    create_before_destroy = true
  }

}

/*
resource "null_resource" "nodesips" {
  provisioner "local-exec" {
    command = "echo '${join("\n",google_compute_instance.ubuntu-nodes.*.network_interface.0.access_config.0.nat_ip)}' >> inventory.txt"

  }
}
*/
