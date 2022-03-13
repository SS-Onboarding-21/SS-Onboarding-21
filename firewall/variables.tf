
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

// security vars

variable "ports" {
  default = ["8080", "8081", "8085", "9000"]
}