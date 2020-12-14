#! /bin/bash

echo "llight 1.0 2020"

target_folder=/sys/class/backlight/intel_backlight/
current_brightness=$(cat ${target_folder}/brightness)
max_brightness=$(cat ${target_folder}/max_brightness)

# functions
usage()
{
    echo "$(basename $0) -[h | v | g | s | i | d]"
    echo "  -h  shows this help and exit"
    echo "  -v  shows version and exit"
    echo "  -g  shows current brightness and exit"
    echo "  -s  changes brightness by given value. Must be between 1 and ${max_brightness}"
    echo "  -i  increases brightness by given value"
    echo "  -d  decreases brightness by given value"

    exit 1
}

if [ $# -eq 0 ]; then
    usage
fi

# truncate -s 0 ${target_folder}/brightness
# echo ${current_brightness} > ${target_folder}/brightness

exit 0
