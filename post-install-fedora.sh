#! /bin/bash

HEIGHT=25
WIDTH=100
CHOICE_HEIGHT=4
BACKTITLE="Fedora post-install-fedora script"
MENU_MSG="Please select one of following options:"

# First, optimize the dnf package manager
sudo cp /etc/dnf/dnf.conf /etc/dnf/dnf.conf.bak
sudo cp dotfiles/dnf/dnf.conf /etc/dnf/dnf.conf

# Check for updates
sudo dnf upgrade --refresh
sudo dnf autoremove -y
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update -y

# Install some tools required by the script
sudo dnf install axel deltarpm unzip -y

# Check if we have dialog installed
# If not, install it
if [ "$(rpm -q dialog 2>/dev/null | grep -c "is not installed")" -eq 1 ]; 
then
    sudo dnf install -y dialog
fi

OPTIONS=(
    1  "Run First-Boot tweaks"
    2  "Optimize BootTime"
    3  "Install Dev tools"
    4  "Install flutter"
    5  "Install Nvidia drivers"
    6  "Install Update-GRUB"
    7  "Install Prefered apps"
    8  "Run All"
    9 "Reboot"
    10 "Quit"
)

while true; do
    CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE - Main menu $(lscpu | grep -i "Model name:" | cut -d':' -f2- - )" \
                --title "$TITLE" \
                --nocancel \
                --menu "$MENU_MSG" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
    clear
    case $CHOICE in 
        1) 
            scripts/base.sh
        ;;
       
        2) 
            scripts/optimizeBootTime.sh
        ;;
        
        3) 
            scripts/installDevTools.sh
        ;;


        4) 
            scripts/flutter.sh
        ;;

        5)
            scripts/nvidiaGpu.sh
        ;;

        6)
            scripts/update_grub.sh
        ;;
        7)
            scripts/autoInstallMyApps.sh
        ;;
        8)
            scripts/base.sh
            scripts/optimizeBootTime.sh
            scripts/installDevTools.sh
            scripts/flutter.sh
            scripts/nvidiaGpu.sh
            scripts/update_grub.sh
            scripts/autoInstallMyApps.sh
        ;;
        9)
            sudo systemctl reboot
        ;;

        10) 
            # Undo any changes made to this repository to clean up
            exit 0
        ;;

    esac
done
