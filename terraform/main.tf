terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.0.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

variable "image" {
  default = "yathrebdifallah233/cvpage:latest"
}

resource "docker_image" "cv_image" {
  name = var.image
}

resource "docker_container" "cvonepagee-test" {
  name    = "moncv"
  image   = var.image
  restart = "unless-stopped"

  ports {
    internal = 80
    external = 8557
  }
}
