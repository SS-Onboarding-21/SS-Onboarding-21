locals {
  timestamp = "${timestamp()}"
  timestamp_no_hyphens = "${replace("${local.timestamp}", "-", "")}"
  timestamp_no_spaces = "${replace("${local.timestamp_no_hyphens}", " ", "")}"
  timestamp_no_t = "${replace("${local.timestamp_no_spaces}", "T", "")}"
  timestamp_no_z = "${replace("${local.timestamp_no_t}", "Z", "")}"
  timestamp_no_colons = "${replace("${local.timestamp_no_z}", ":", "")}"
  timestamp_sanitized = "${local.timestamp_no_colons}"
}

provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
  zone        = var.zone
  user_project_override = true
}

resource "google_compute_instance" "node-1" {
  name = "node-1-${local.timestamp_sanitized}"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20201014"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

}

resource "google_compute_instance" "node-2" {
  name = "node-2-${local.timestamp_sanitized}"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20201014"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

}

//resource "google_compute_firewall" "my_firewall" {
//  name = "test-firewall"
//  network = "default"
//  allow {
//    protocol = "tcp"
//    ports = ["22"]
//  }
//}

data "template_file" "dev_hosts" {
  template = file("${path.module}/templates/dev_hosts.cfg")
  depends_on = [
    google_compute_instance.node-1,
    google_compute_instance.node-2,
  ]
  vars = {
    api_node_1 = google_compute_instance.node-1.network_interface.0.access_config.0.nat_ip
    api_node_2 = google_compute_instance.node-2.network_interface.0.access_config.0.nat_ip
  }
}

resource "null_resource" "dev-hosts" {
  triggers = {
    template_rendered = data.template_file.dev_hosts.rendered
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.dev_hosts.rendered}' > inventory.txt"
  }
}

