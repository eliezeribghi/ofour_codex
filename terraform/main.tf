provider "google" {
  project     = "skilled-anthem-452614-h7"
  credentials = "google_key.json"
  region      = "us-central1"
  zone        = "us-central1-a"
}
resource "google_compute_address" "default" {
  name   = "ofour-static-ip"
  region = "us-central1"
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
    access_config {
      nat_ip = google_compute_address.default.address # Maintenant Terraform le reconnaît
    }
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
resource "google_compute_instance" "ofour-dev" {
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


## Creation des buckets



resource "random_id" "bucket_ofour" {
  byte_length = 8
}

resource "google_storage_bucket" "static" {
  name                        = "${random_id.bucket_ofour.hex}-new-bucket" # Nom généré dynamiquement
  location                    = "EU"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = false # Simplification des règles d'accès

  versioning {
    enabled = true # Activer la gestion des versions des objets
  }
}

resource "google_storage_bucket_object" "stats_file" {
  name         = "stats"                           # Nom du fichier à stocker dans le bucket
  bucket       = google_storage_bucket.static.name # Utilisation du bucket dynamique généré
  source       = "./terraform.tfstate"             # Chemin du fichier local à uploader
  content_type = "application/json"                # Type du fichier (adapter si nécessaire)

}
resource "google_storage_bucket_object" "sql_file" {
  name   = "sql"
  bucket = google_storage_bucket.static.name
  source = "bdd/init.sql"
}

resource "google_project_iam_member" "sql_client" {
  project = "skilled-anthem-452614-h7"
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_sql_database_instance.mysql-instance.service_account_email_address}"
}

resource "google_storage_bucket_iam_member" "sql_storage_object_viewer" {
  bucket = google_storage_bucket.static.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_sql_database_instance.mysql-instance.service_account_email_address}"
}





# creation de la bdd 




resource "google_sql_database_instance" "mysql-instance" {
  name             = "mysql-instance"
  database_version = "MYSQL_8_0"
  region           = "us-central1"


  settings {
    availability_type = "ZONAL"
    disk_size         = 10
    disk_type         = "PD_SSD"
    ip_configuration {
      # Add optional authorized networks
      # Update to match the customer's networks
      authorized_networks {
        name  = "test-net-3"
        value = "203.0.113.0/24"
      }
      authorized_networks {
        name  = "ofour-dev"
        value = "35.209.188.111"
      }
      authorized_networks {
        name  = "ofour-test-server"
        value = "34.60.91.213"
      }
      authorized_networks {
        name  = "test-net-3"
        value = "203.0.113.0/24"
      }
      authorized_networks {
        name  = "nour"
        value = "94.239.80.68"
      }
      authorized_networks {
        name  = "nour"
        value = "94.239.80.68"
      }
      authorized_networks {
        name  = "nour_kourou"
        value = "35.180.86.91"
      }
      authorized_networks {
        name  = "eliezer_kourou"
        value = "35.180.198.214"
      }
      authorized_networks {
        name  = "eliezer"
        value = "88.138.236.172"
      }
      # Enable public IP
      ipv4_enabled = true
    }
    tier = "db-f1-micro"
  }

}

resource "null_resource" "import_sql" {
  depends_on = [google_sql_database_instance.mysql-instance, google_storage_bucket_object.sql_file]

provisioner "local-exec" {
  command = <<EOT
    gcloud auth activate-service-account ${google_sql_database_instance.mysql-instance.service_account_email_address} --key-file=google_key.json
    gcloud sql import sql ${google_sql_database_instance.mysql-instance.name} gs://${google_storage_bucket.static.name}/${google_storage_bucket_object.sql_file.name} --database=ofour
  EOT
}

}





resource "google_sql_database" "ofour" {
  name     = "ofour"
  instance = google_sql_database_instance.mysql-instance.name
}

resource "google_sql_user" "root" {
  name        = "root"
  instance    = google_sql_database_instance.mysql-instance.name
  password_wo = "v7f3dB5Y6U6cZ5Pf"
}


