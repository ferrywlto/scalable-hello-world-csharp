terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "hello-world" {
  name         = "local/scalable-hello-world-csharp:latest"
  keep_locally = false
}

resource "docker_container" "hello-world-local" {
  image = docker_image.hello-world.name
  name  = "hello-world-local"
  ports {
    internal = 80
    external = 5080
  }
  ports {
    internal = 443
    external = 5443
  }
}

locals {
  hostname = docker_container.hello-world-local.hostname
  ports    = docker_container.hello-world-local.ports
}