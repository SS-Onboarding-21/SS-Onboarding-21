
output "node_server_0-ip" {
  value = google_compute_instance.node_server0.network_interface.0.access_config.0.nat_ip
}
