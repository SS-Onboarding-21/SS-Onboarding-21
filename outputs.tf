
output "jenkins_server-ip" {
  value = google_compute_instance.jenkins_server.network_interface.0.access_config.0.nat_ip
}

output "node_server_0-ip" {
  value = google_compute_instance.node_server-0.network_interface.0.access_config.0.nat_ip
}
output "node_server_1-ip" {
  value = google_compute_instance.node_server-1.network_interface.0.access_config.0.nat_ip
}


/*
output "jenkins-ip" {
  value = google_compute_instance.jenkins_server.network_interface.0.access_config.0.nat_ip
}
*/