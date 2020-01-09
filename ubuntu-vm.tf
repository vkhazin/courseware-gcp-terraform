resource "google_compute_instance" "default" {
  name         = "ubuntu-vm"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.subnetwork.name
    access_config {
      // Include this section to give the VM an external ip address
    }
  }
  metadata = {
    sshKeys = "gcpadmin:${file("gcpadmin-key.pub")}"
  }

  // Apply the firewall rule to allow external IPs to access this instance
  tags = ["ssh"]
}