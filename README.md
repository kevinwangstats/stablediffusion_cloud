# Running Stable Diffusion on Google Cloud

1. Start VM instance

```
gcloud compute instances create instance-1 
    --project=voice-387504 
    --zone=us-west3-b 
    --machine-type=n1-standard-2 
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default 
    --maintenance-policy=TERMINATE 
    --provisioning-model=STANDARD 
    --service-account=472617370467-compute@developer.gserviceaccount.com 
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append 
    --accelerator=count=1,type=nvidia-tesla-t4 
    --tags=http-server,https-server 
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/ml-images/global/images/c0-deeplearning-common-gpu-v20231105-debian-11-py310,mode=rw,size=50,type=projects/voice-387504/zones/us-west3-b/diskTypes/pd-balanced --no-shielded-secure-boot 
    --shielded-vtpm 
    --shielded-integrity-monitoring 
    --labels=goog-ec-src=vm_add-gcloud 
    --reservation-affinity=any
```

1. SSH into the VM instance.

https://cloud.google.com/compute/docs/connect/standard-ssh

1. Confirm installation of NVIDIA Accelerated Graphics Driver

Just press 'y' and Enter after SSH into the VM instance when prompted. 

1. Git clone this repo





1. Stop VM instance

```

```