
// provider vars

variable "project" {
  default = "ss-geo-327714"
}
variable "region" {
  default = "us-central1" // europe-north1
}
variable "zone" {
  default = "us-west1-a" // europe-north1-a
}

// instances vars

variable "ubuntu-boot_disk_image" {
  default = "ubuntu-2004-focal-v20210927"
}

variable "node-machine_type" {
  default = "e2-medium"
}

variable "nodes_count" {
  default = 2
}




// security vars

variable "ports" {
  default = ["8080", "8081", "8085", "9000"]
}
