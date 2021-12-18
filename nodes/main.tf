
provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}

// instances

resource "google_compute_instance" "nodes" {

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
    ssh-keys = "${var.ssh_user}:${file("${var.public_key_path}")}"
  }

  lifecycle {
    create_before_destroy = true
  }

}

// outputs

output "nodes-ips" {
  value = google_compute_instance.nodes.*.network_interface.0.access_config.0.nat_ip
}


/*
resource "null_resource" "nodesips" {
  provisioner "local-exec" {
    command = "echo '${join("\n",google_compute_instance.ubuntu-nodes.*.network_interface.0.access_config.0.nat_ip)}' >> inventory.txt"

  }
}
*/
