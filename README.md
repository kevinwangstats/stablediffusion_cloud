# Minimum SD requirements

Nvidia Graphics Card
6.9GB VRAM
10GB Hard Drive
8GB Memory (RAM)


# Manual configs on GC

Monthly estimate

US$136.25
That's about US$0.19 hourly

Pay for what you use: No upfront costs and per-second billing

Item
Monthly estimate
4 vCPU + 15 GB memory	
US$29.20	
1 NVIDIA T4	
US$131.25	
50 GB balanced persistent disk	
US$5.00	
Total	
US$136.25	
Compute Engine pricing 

Enable Firewalls - HTTP/HTTPS
Enable IP forwarding


```
# This code is compatible with Terraform 4.25.0 and versions that are backward compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "instance-1" {
  boot_disk {
    auto_delete = true
    device_name = "instance-1"

    initialize_params {
      image = "projects/ml-images/global/images/c0-deeplearning-common-gpu-v20230822-debian-11-py310"
      size  = 50
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = true
  deletion_protection = false
  enable_display      = true

  guest_accelerator {
    count = 1
    type  = "projects/voice-387504/zones/us-west3-b/acceleratorTypes/nvidia-tesla-t4"
  }

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "n1-standard-4"
  name         = "instance-1"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/voice-387504/regions/us-west3/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "TERMINATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "472617370467-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = ["http-server", "https-server"]
  zone = "us-west3-b"
}
```

```
sudo apt-get update
sudo apt-get install gcc make ufw -y

sudo ufw allow 7860/tcp

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ~/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME
source $HOME/miniconda3/etc/profile.d/conda.sh
conda activate base

wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda_11.8.0_520.61.05_linux.run
sudo sh cuda_11.8.0_520.61.05_linux.run
```