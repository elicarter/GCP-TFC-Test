terraform {
      cloud {
    organization = "ACME-TFC-DEMO"
      workspaces {
    name = "GCP-Test"
    }
  }
     required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.28.0"
    }
  }
}

provider "google" {
  project     = "acme-tfc-demo"
  region      = "us-west3"
}

resource "google_compute_instance" "vm_instance" {
  name         = "my-vm-instance"
  machine_type = "n1-standard-1"
  zone         = "us-west3-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
