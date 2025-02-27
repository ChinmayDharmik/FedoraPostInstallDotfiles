#! /bin/bash

echo "Optimizing boot time for your PC/laptop"
echo "Checking if your CPU is Intel's CPU or not"
if [ "$(< /proc/cpuinfo grep "GenuineIntel" | head -1 | cut -d "e" -f 4-)" == "Intel" ]; 
then 
    echo "Your CPU is Intel's CPU, let's optimize it"
    lscpu | grep -i "Model name"
    echo -e "\nGRUB_CMDLINE_LINUX_DEFAULT=\"intel_idle.max_cstate=1 cryptomgr.notests initcall_debug intel_iommu=igfx_off no_timer_check noreplace-smp page_alloc.shuffle=1 rcupdate.rcu_expedited=1 tsc=reliable quiet splash video=SVIDEO-1:d\"" | sudo tee -a /etc/default/grub # This is from Clear Linux, my friends found out this and suggested me
    scripts/update_grub.sh
    sudo systemctl disable NetworkManager-wait-online.service # This one take the longest time while booting on my laptop
else
    echo "Your CPU is not Intel's CPU, doing some basic optimization"
    sudo systemctl disable NetworkManager-wait-online.service # This one take the longest time while booting on my laptop
fi

read -rp "Press any key to continue" _
