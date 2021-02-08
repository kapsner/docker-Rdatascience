#!/bin/bash

cd ../base_image_gpu/
./build_gpu_base.sh
cd ../Pdatascience/

printf "\nBuild pdsc_gpu_base image\n"
# docker build --build-arg BASEIMAGE=gpu_base:latest -f image_pdsc_base/Dockerfile -t pdsc_gpu_base .
docker build --network host --build-arg BASEIMAGE=gpu_base:latest -f image_pdsc_base/Dockerfile -t pdsc_gpu_base .

printf "\nBuild pdsc_gpu image\n"
#docker build -f image_pdsc_gpu/Dockerfile -t pdsc_gpu .
docker build --network host -f image_pdsc_gpu/Dockerfile -t pdsc_gpu .

printf "\nBuild pdsc_jpylab_gpu image\n"
docker build --build-arg BASEIMAGE=pdsc_gpu:latest -f image_pdsc_jpylab/Dockerfile -t pdsc_jpylab_gpu .
