
sudo apt-get update
sudo apt install -y wget git python3 python3-venv libgl1 libglib2.0-0 

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
cd stable-diffusion-webui

bash ~/stable-diffusion-webui/webui.sh

## Install xformers
# source ./venv/bin/activate
# cd repositories
# git clone https://github.com/facebookresearch/xformers.git
# cd xformers
# git submodule update --init --recursive
# pip install -r requirements.txt
# pip install -e .

## Install miniconda3
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# bash ~/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3
# source $HOME/miniconda3/etc/profile.d/conda.sh
# conda activate base

## Install NVIDIA 
# wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda_11.8.0_520.61.05_linux.run
# sudo sh cuda_11.8.0_520.61.05_linux.run

## Run this locally to do port forwarding
# gcloud compute ssh kevinwangstats@instance-1 -- -L 7861:localhost:7861

## Download ControlNet QC Code model
# mkdir ~/stable-diffusion-webui/models/ControlNet
# wget -P ~/stable-diffusion-webui/models/ControlNet https://civitai.com/api/download/models/122143 --content-disposition

## Download Stable-diffusion model
# wget -P ~/stable-diffusion-webui/models/Stable-diffusion https://civitai.com/api/download/models/148587 --content-disposition
