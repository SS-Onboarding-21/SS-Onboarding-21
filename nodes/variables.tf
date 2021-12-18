
// provider vars

variable "project" {
  default = "ss-geo-327714"
}
variable "region" {
  default = "us-west1" // europe-north1
}
variable "zone" {
  default = "us-west1-a" // europe-north1-a
}

variable "ssh_user" {
  description = "User for connection to google machine"
  default     = "user"
}
variable "public_key_path" {
  description = "Path to file containing public key"
  //default     = "C:\\Users\\kvozn/.ssh/id_rsa.pub"
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
