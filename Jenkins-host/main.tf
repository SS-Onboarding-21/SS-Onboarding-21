
provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}

// instance

resource "google_compute_instance" "jenkins_server" {

  name         = "jenkins"

  machine_type = var.jenkins-machine_type

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
    ssh-keys = "kateryna:${file("C:\\Users\\kvozn/.ssh/id_rsa.pub")}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

// outputs

output "jenkins_server-ip" {
  value = google_compute_instance.jenkins_server.network_interface.0.access_config.0.nat_ip
}
