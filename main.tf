/*
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.2.1"
    }
  }
}
*/
/*
provider "google" {
  region = "europe-north1"
}
*/


// instances

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


resource "google_compute_instance" "node_server-0" {
  name         = "node-server-0"
  machine_type = var.node-machine_type
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

resource "google_compute_instance" "node_server-1" {
  name         = "node-server-1"
  machine_type = var.node-machine_type
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
