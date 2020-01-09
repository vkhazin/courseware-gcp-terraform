resource "google_compute_firewall" "allow-tag-ssh" {
  name          = "${google_compute_network.network.name}-ingress-tag-ssh"
  description   = "Allow SSH to machines with 'ssh' tag"
  network       = google_compute_network.network.name
  project       = var.project_id
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}