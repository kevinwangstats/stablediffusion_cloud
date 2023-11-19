#!/bin/bash

# WORKING_DIR=$HOME/projects
WORKING_DIR=$HOME

sudo apt-get update
sudo apt install -y wget git python3 python3-venv libgl1 libglib2.0-0

PYTHON3_PATH=$(which python3)
PIP3_PATH=$(which pip3)
$PIP3_PATH install opencv-python moviepy pillow

## Install miniconda3
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# bash ~/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3
# source $HOME/miniconda3/etc/profile.d/conda.sh
# conda activate base

cd $WORKING_DIR
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
SDUI_DIR=$WORKING_DIR/stable-diffusion-webui

cd $SDUI_DIR

# Start the webui.sh command with a timeout
timeout 2400s bash ./webui.sh --no-download-sd-model

# Check the exit status of the command
if [ $? -eq 124 ]; then
    # The command was interrupted due to the timeout
    echo "Command timed out."
else
    # The command completed within 3 minutes or with a different exit status
    echo "Command completed."
fi

## Install xformers (takes a very long time)
# source ./venv/bin/activate
# cd repositories
# git clone https://github.com/facebookresearch/xformers.git
# cd xformers
# git submodule update --init --recursive
# pip install -r requirements.txt
# pip install -e .

## Run this locally to do port forwarding, so the SD UI runs locally at localhost:7860
# gcloud compute ssh --project=voice-387504 --zone=us-west3-b kevinwangstats@instance-1 -- -L 7860:localhost:7860

## Run this to transfer images out
# gcloud compute scp --project=voice-387504 --zone=us-west3-b kevinwangstats@instance-1:~/stablediffusion_cloud/img ~/Desktop
 
## Creating a machine(disk) image
# gcloud beta compute machine-images create sd-base --project=voice-387504 --description=base\ image\ using\ stable\ diffusion\ setup --source-instance=instance-1 --source-instance-zone=us-west3-b --storage-location=us