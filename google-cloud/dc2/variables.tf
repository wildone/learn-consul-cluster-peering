variable "project" {
  type = string
  description = "Google Cloud project"
}

variable "dc1_zone" {
  type = string
  description = "Google Cloud zone for first cluster"
  default = "us-central1-a"
}

variable "dc2_zone" {
  type = string
  description = "Google Cloud zone for second cluster"
  default = "us-west1-b"
}
