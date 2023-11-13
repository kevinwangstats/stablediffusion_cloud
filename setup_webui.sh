#!/bin/bash

# WORKING_DIR=$HOME/projects
WORKING_DIR=$HOME

sudo apt-get update
sudo apt install -y wget git python3 python3-venv libgl1 libglib2.0-0

PYTHON3_PATH=$(which python3)
PIP3_PATH=$(which pip3)
pip3 install opencv-python moviepy pillow

## Install miniconda3
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# bash ~/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3
# source $HOME/miniconda3/etc/profile.d/conda.sh
# conda activate base

cd $WORKING_DIR
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
SDUI_DIR=$WORKING_DIR/stable-diffusion-webui

## Download ControlNet QR Code model
mkdir $SDUI_DIR/models/ControlNet
wget -P $SDUI_DIR/models/ControlNet https://civitai.com/api/download/models/122143 --content-disposition

## Download Landscape stable-diffusion model
wget -P $SDUI_DIR/models/Stable-diffusion https://civitai.com/api/download/models/148587 --content-disposition

bash $SDUI_DIR/webui.sh

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