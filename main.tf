# Terraform version compatibility note
# This code is compatible with Terraform 4.25.0 and versions that are backward compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

# Define a Google Compute Engine instance resource named "instance-1"
resource "google_compute_instance" "instance-1" {

  # Configuration for the instance's boot disk
  boot_disk {
    auto_delete = true
    device_name = "instance-1"

    initialize_params {
      # Specify the image for the boot disk
      image = "projects/ml-images/global/images/c0-deeplearning-common-gpu-v20230822-debian-11-py310"
      size  = 50
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  # Allow the instance to forward IP packets
  can_ip_forward      = true

  # Disable deletion protection for the instance
  deletion_protection = false

  # Enable display (used for graphical desktop environments)
  enable_display      = true

  # Configure GPU acceleration for the instance
  guest_accelerator {
    count = 1
    type  = "projects/voice-387504/zones/us-west3-b/acceleratorTypes/nvidia-tesla-t4"
  }

  # Labels for the instance
  labels = {
    goog-ec-src = "vm_add-tf"
  }

  # Set the machine type for the instance
  machine_type = "n1-standard-4"

  # Name of the instance
  name         = "instance-1"

  # Network interface configuration
  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    # Specify the subnetwork for the instance
    subnetwork = "projects/voice-387504/regions/us-west3/subnetworks/default"
  }

  # Scheduling options for the instance
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "TERMINATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  # Service account configuration for the instance
  service_account {
    email  = "472617370467-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  # Shielded instance configuration
  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  # Tags for the instance (used for firewall rules)
  tags = ["http-server", "https-server"]

  # Zone where the instance is located
  zone = "us-west3-b"
}
