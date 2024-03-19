#!/bin/bash

sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora37/x86_64/cuda-fedora37.repo
sudo dnf clean all
sudo dnf module disable nvidia-driver
sudo dnf -y install cuda

sudo dnf install https://developer.download.nvidia.com/compute/machine-learning/repos/rhel8/x86_64/nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm
sudo dnf install libcudnn7 libcudnn7-devel libnccl libnccl-devel

read -rp "Press any key to continue" _