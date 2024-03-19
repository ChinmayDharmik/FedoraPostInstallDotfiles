#! /bin/bash

echo "Installing Nvidia Drivers"
sudo dnf install kmodtool akmods mokutil openssl -y
sudo kmodgenca -a

sudo mokutil --import /etc/pki/akmods/certs/public_key.der

sudo dnf install gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs

sudo akmods --force
sudo dracut --force

echo("Rebooting")
sudo reboot now


