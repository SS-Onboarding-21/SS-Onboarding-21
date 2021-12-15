// instance

resource "google_compute_instance" "jenkins_server" {
  name         = "jenkins-server"
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
    ssh-keys = "kateryna:${file("C:\\Users\\katya/.ssh/id_rsa.pub")}"
  }
}