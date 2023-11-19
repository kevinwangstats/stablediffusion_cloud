#!/bin/bash

# WORKING_DIR=$HOME/projects
WORKING_DIR=$HOME
SDUI_DIR=$WORKING_DIR/stable-diffusion-webui

## Download stable diffusion v1.5
wget -P $SDUI_DIR/models/Stable-diffusion https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors --content-disposition

## Download ControlNet QR Code model
mkdir $SDUI_DIR/models/ControlNet
wget -P $SDUI_DIR/models/ControlNet https://civitai.com/api/download/models/122143 --content-disposition

## Download Landscape stable-diffusion model
wget -P $SDUI_DIR/models/Stable-diffusion https://civitai.com/api/download/models/148587 --content-disposition