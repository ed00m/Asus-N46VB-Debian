#!/bin/sh

op=${1? Ingrese cantidad de brillo [alto, medio, min, off]}

bri_max=5

bri_min=1
bri_off=0

bri_target=/sys/class/leds/asus::kbd_backlight/brightness

case ${op} in
    alto)
        echo $(expr ${bri_min} \* 4) > ${bri_target}
        echo "echo $(expr ${bri_min} \* 4) > ${bri_target}"
        echo "[] Brillo alto aplicado"
    ;;
    medio)
        echo $(expr ${bri_min} \* 2) > ${bri_target}
        echo "echo $(expr ${bri_min} \* 2) > ${bri_target}"
        echo "[] Brillo medio aplicado"
    ;;
    min)
        echo $(expr ${bri_min}) > ${bri_target}
        echo "echo $(expr ${bri_min}) > ${bri_target}"
        echo "[] Brillo minimo aplicado"
    ;;

    off)
        echo $(expr ${bri_off}) > ${bri_target}
        echo "echo $(expr ${bri_off}) > ${bri_target}"
        echo "[] Brillo apagado"
    ;;

esac
