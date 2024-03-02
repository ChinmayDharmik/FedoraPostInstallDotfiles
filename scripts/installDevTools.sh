#! /bin/bash

sudo dnf install -y git 

## Miniconda
curl -sS https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o miniconda.sh
bash ./miniconda.sh 

rm miniconda.sh

## VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install -y code

# GitHub Desktop
sudo flatpak install github-desktop

sudo dnf install -y nodejs npm 

read -rp "Press any key to continue" _