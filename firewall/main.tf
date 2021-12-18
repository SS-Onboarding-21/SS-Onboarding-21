
provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}

// google compute firewall "default"

resource "google_compute_firewall" "default" {
  name    = "default-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = var.ports
  }

  source_tags = ["src-tag"]

}