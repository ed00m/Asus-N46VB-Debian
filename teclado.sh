#!/bin/sh

#||||||||||||||||||||||||||||||||\_________________________
# Keyboard Lightning
#||||||||||||||||||||||||||||||||/´´´´´´´´´´´´´´´´´´´´´´´´´

op=${1? Elige brillo del teclado [alto, medio, min, off]}

bri_max=5
bri_min=1
bri_off=0
bri_target=/sys/class/leds/asus::kbd_backlight/brightness

case ${op} in
    alto)
        echo $(expr ${bri_min} \* 4) > ${bri_target}
        echo "[] Keyboard: Brillo alto aplicado"
    ;;
    medio)
        echo $(expr ${bri_min} \* 2) > ${bri_target}
        echo "[] Keyboard: Brillo medio aplicado"
    ;;
    min)
        echo $(expr ${bri_min}) > ${bri_target}
        echo "[] Keyboard: Brillo minimo aplicado"
    ;;

    off)
        echo $(expr ${bri_off}) > ${bri_target}
        echo "[] Keyboard: Brillo apagado"
    ;;

esac

exit 0
