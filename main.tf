provider "google" {
  project     = "skilled-anthem-452614-h7"
  credentials = "google_key.json"
  region      = "us-central1"
  zone        = "us-central1-a"
}

# Create the first Compute Engine instance
resource "google_compute_instance" "server" {
  name         = "ofour-test-server"
  machine_type = "n4-standard-2"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2404-noble-amd64-v20250117"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = <<EOF
    eliezer:${file("/home/student/.ssh/ansible-ofour.pub")}
    kevin:${file("/home/student/Bureau/ofour/ssh_codex/sshKevin.pub")}
    nour:${file("/home/student/Bureau/ofour/ssh_codex/sshNour.pub")}
    EOF
  }
}




# Create the fourth Compute Engine instance
resource "google_compute_instance" "nour" {
  name         = "ofour-dev"
  machine_type = "n4-standard-2"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2404-noble-amd64-v20250117"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = <<EOF
    eliezer:${file("/home/student/.ssh/ansible-ofour.pub")}
    kevin:${file("/home/student/Bureau/ofour/ssh_codex/sshKevin.pub")}
    nour:${file("/home/student/Bureau/ofour/ssh_codex/sshNour.pub")}
    EOF
  }
}

# Create a firewall rule to allow SSH traffic
resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  network       = "default"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

