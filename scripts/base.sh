#! /bin/bash

echo "Installing Essentials for Fedora"

echo "Enabling RPMFusion and Flathub"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm -y
sudo dnf upgrade --refresh -y
sudo dnf groupupdate core -y
sudo dnf install rpmfusion-free-release-tainted -y
sudo dnf install dnf-plugins-core -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Enabling dnf-automatic(Automatic updates)"
sudo dnf install dnf-automatic -y
sudo cp dotfiles/dnf/automatic.conf /etc/dnf/automatic.conf
sudo systemctl enable --now dnf-automatic.timer



sudo dnf update -y
sudo dnf upgrade -y
sudo dnf install -y dnf-plugins-core wget curl git 

## Media Codecs
echo "Installing media codecs"
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional Multimedia -y

sudo dnf install -y gnome-extensions-app gnome-tweaks
sudo dnf install -y gnome-shell-extension-appindicator
sudo dnf install -y vlc kitty 

echo "Installing Nerd Fonts and apply it to system fonts"
mkdir -p fonts
cd fonts &&  wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip  && cd ../
cd fonts && wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraMono.zip && cd ../
cd fonts && wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Mononoki.zip && cd ../

unzip fonts/FiraCode.zip -d fonts
unzip fonts/FiraMono.zip -d fonts
unzip fonts/Mononoki.zip -d fonts
mkdir -p ~/.local/share/fonts

cp fonts/*.ttf ~/.local/share/fonts

fc-cache
rm -rf fonts

mkdir "$HOME"/.config/kitty/
# Copy all of my config files to the config folder
cp -r dotfiles/kitty/ ~/.config/kitty

echo "Go to ~/.config/kitty/ to edit Kitty's config files"

echo "Installing Starship and its dependencies"
curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config && touch ~/.config/starship.toml

echo 'eval "$(starship init bash)"'>> ~/.bashrc
echo 'export TERM=xterm-256color'>> ~/.bashrc
cp dotfiles/starship.toml ~/.config/starship.toml

read -rp "Press any key to continue" _
