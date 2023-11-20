#!/bin/bash

# WORKING_DIR=$HOME/projects
WORKING_DIR=$HOME
SDUI_DIR=$WORKING_DIR/stable-diffusion-webui
MODEL_SD=$SDUI_DIR/models/Stable-diffusion
MODEL_CN=$SDUI_DIR/models/ControlNet

cp $WORKING_DIR/stablediffusion_cloud/controlnet_cxk.txt $WORKING_DIR/stable-diffusion-webui/extensions/sd-webui-controlnet/presets/

## Download stable diffusion v1.5
wget -P $MODEL_SD https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors --content-disposition

## Download ControlNet QR Code model
mkdir $SDUI_DIR/models/ControlNet
wget -P $MODEL_CN https://civitai.com/api/download/models/122143 --content-disposition

## Download Landscape stable-diffusion model
wget -P $MODEL_SD https://civitai.com/api/download/models/148587 --content-disposition

## Download chilloutmix human base model
wget -P $MODEL_SD https://civitai.com/api/download/models/11745  --content-disposition

## Download epic realism human base model
wget -P $MODEL_SD https://civitai.com/api/download/models/25694  --content-disposition

## Download magic mix human base model
wget -P $MODEL_SD https://civitai.com/api/download/models/43331  --content-disposition