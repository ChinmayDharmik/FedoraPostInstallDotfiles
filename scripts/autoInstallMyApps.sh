#! /bin/bash

curl -sS https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -o google-chrome.rpm
sudo dnf install google-chrome.rpm -y
rm google-chrome.rpm

curl -sS https://releases.warp.dev/stable/v0.2024.02.27.08.01.stable_03/warp-terminal-v0.2024.02.27.08.01.stable_03-1.x86_64.rpm -o warp.rpm
sudo dnf install warp.rpm -y
rm warp.rpm

sudo dnf install vlc htop neofetch kitty htop bpytop -y
sudo flatpak install flathub com.slack.Slack -y
sudo flatpak install flathub md.obsidian.Obsidian -y
sudo flatpak install flathub com.spotify.Client -y
sudo flatpak install flathub com.discordapp.Discord -y
sudo flatpak install flathub org.qbittorrent.qBittorrent -y
sudo flatpak install flathub com.brave.Browser -y
sudo flatpak install flathub org.zotero.Zotero -y
sudo flatpak install flathub com.toolstack.Folio

read -rp "Press any key to continue" _