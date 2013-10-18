#!/bin/sh -x

op=${1? Ingrese cantidad de brillo [alto, medio, min]}

bri_max=$(cat /sys/class/backlight/intel_backlight/max_brightness)

bri_min=400
bri_net=$(expr ${bri_max} - ${bri_min})

bri_int=$(expr ${bri_net} / 3)

bri_target=/sys/class/backlight/intel_backlight/brightness

case ${op} in
    alto)
        echo $(expr ${bri_min} + ${bri_int} \* 2) > ${bri_target}
        echo "echo $(expr ${bri_min} + ${bri_int} \* 2) > ${bri_target}"
        echo "[] Brillo alto aplicado"
    ;;
    medio)
        echo $(expr ${bri_min} + ${bri_int}) > ${bri_target}
        echo "echo $(expr ${bri_min} + ${bri_int}) > ${bri_target}"
        echo "[] Brillo medio aplicado"
    ;;
    min)
        echo $(expr ${bri_min}) > ${bri_target}
        echo "echo $(expr ${bri_min}) > ${bri_target}"
        echo "[] Brillo minimo aplicado"
    ;;
esac
