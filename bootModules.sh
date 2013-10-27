#!/bin/sh -x

#||||||||||||||||||||||||||||||||\_________________________
# Boot Modules
#||||||||||||||||||||||||||||||||/´´´´´´´´´´´´´´´´´´´´´´´´´

# Modules
# Sound
#   woofer
# Keyboard

target=/etc/rc.local
dirTMP=/tmp
fileTMP=${dirTMP}/$$_file
user=$(whoami)


if [ ! "${user}" = "root" ];then
    echo "[] No permissions"
else
    
    if [ -w ${target} ];then
        
        cat /etc/rc.local|sed -e "/exit 0/d" > ${fileTMP}_rclocal
        # if exists, Clearing values
        sed -i -e "/echo 0x16 0x99130112/d" ${fileTMP}_rclocal
        sed -i -e "/sys\/class\/sound\/card0\/hwC0D0\/reconfig/d" ${fileTMP}_rclocal
        sed -i -e "/modprobe asus_nb_wmi/d" ${fileTMP}_rclocal
        sed -i -e "/sys\/class\/leds\/asus::kbd_backlight\/brightness/d" ${fileTMP}_rclocal
        sed -i -e "/sys\/class\/backlight\/intel_backlight\/brightnes/d" ${fileTMP}_rclocal
        # titles
        sed -i -e "/# Asus N46VB woofer Bang & Olufen ICEpower/d" ${fileTMP}_rclocal
        sed -i -e "/# Asus N46VB Keyboard backlightning/d" ${fileTMP}_rclocal
        sed -i -e "/# default Values Display lightning & Keyboard backlightning/d" ${fileTMP}_rclocal
        
        # write values into target
        echo "# Asus N46VB woofer Bang & Olufen ICEpower" >> ${fileTMP}_rclocal 
        echo "echo 0x16 0x99130112 > /sys/class/sound/card0/hwC0D0/user_pin_configs" >> ${fileTMP}_rclocal
        echo "echo 1 > /sys/class/sound/card0/hwC0D0/reconfig" >> ${fileTMP}_rclocal
        
        echo "# Asus N46VB Keyboard backlightning" >> ${fileTMP}_rclocal
        echo "modprobe asus_nb_wmi" >> ${fileTMP}_rclocal
        
        echo "# default Values Display lightning & Keyboard backlightning" >> ${fileTMP}_rclocal
        echo "echo 1   > /sys/class/leds/asus::kbd_backlight/brightness" >> ${fileTMP}_rclocal
        echo "echo 500 > /sys/class/backlight/intel_backlight/brightness" >> ${fileTMP}_rclocal
        
        echo "exit 0" >> ${fileTMP}_rclocal
        
        cat ${fileTMP}_rclocal > ${target} 
        
    else
        echo "[] No permissions"
    fi
fi

exit 0
