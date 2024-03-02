#! /bin/bash

curl -sS https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -o google-chrome.rpm
sudo dnf install google-chrome.rpm -y
rm google-chrome.rpm

sudo dnf install vlc htop neofetch kitty htop bpytop -y
flatpak install flathub com.slack.Slack -y
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub org.qbittorrent.qBittorrent -y
flatpak install flathub com.brave.Browser -y

read -rp "Press any key to continue" _