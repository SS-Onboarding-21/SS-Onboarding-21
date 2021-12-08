locals {
  timestamp = "${timestamp()}"
  timestamp_no_hyphens = "${replace("${local.timestamp}", "-", "")}"
  timestamp_no_spaces = "${replace("${local.timestamp_no_hyphens}", " ", "")}"
  timestamp_no_t = "${replace("${local.timestamp_no_spaces}", "T", "")}"
  timestamp_no_z = "${replace("${local.timestamp_no_t}", "Z", "")}"
  timestamp_no_colons = "${replace("${local.timestamp_no_z}", ":", "")}"
  timestamp_sanitized = "${local.timestamp_no_colons}"
}

// instances

resource "google_compute_instance" "node_server1" {
  name = "node-${local.timestamp_no_colons}-1"
  machine_type = var.node-machine_type
  //count = var.nodes_count
  boot_disk {
    initialize_params {
      image = var.ubuntu-boot_disk_image
    }
  }
  network_interface {
    # A default network is created for all GCP projects
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

