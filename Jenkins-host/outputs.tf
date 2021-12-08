
output "jenkins_server-ip" {
  value = google_compute_instance.jenkins_server.network_interface.0.access_config.0.nat_ip
}
