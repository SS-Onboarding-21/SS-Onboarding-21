
// instances vars

variable "jenkins-machine_type" {
  default = "e2-standard-2"
}

variable "ubuntu-boot_disk_image" {
  default = "ubuntu-2004-focal-v20210927"
}


// security vars

variable "ports" {
  default = ["8080", "8081", "8085", "9000"]
}