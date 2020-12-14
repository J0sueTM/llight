#! /bin/bash

# main.sh
# Josue Teodoro Moreira <jteodomo@gmail.com> <josue.moreira2@etec.sp.gov.br>
# December 13, 2020

target_folder=/sys/class/backlight/intel_backlight
current_brightness=$(cat ${target_folder}/brightness)
max_brightness=$(cat ${target_folder}/max_brightness)

# print usage / help
usage()
{
    echo "$(basename $0) -[h | v | g | s | i | d]."
    echo
    echo "Make sure to run llight with administrator rights. e. g. 'sudo llight -h'."
    echo
    echo "  -h  shows this help and exit."
    echo "  -v  shows version and exit."
    echo "  -g  shows current brightness and exit."
    echo "  -s  changes brightness by given value. Must be between 1 and 100."
    echo "  -i  increases brightness by given value."
    echo "  -d  decreases brightness by given value."

    exit 1
}

set_by_value()
{
    if [ ${1} -lt 1 ] || [ ${1} -gt 100 ]; then
        echo "Value must be between 1 and 100."

        usage
    fi

    let new_brightness=$((${max_brightness} / 100 * ${1}))
    echo "${new_brightness}" | sudo tee ${target_folder}/brightness > /dev/null
}

increase_by_value()
{
    if [ $((${current_brightness} + ${1})) -gt ${max_brightness} ]; then
        echo "Already on maximum brightness. Try a smaller number or -s instead."

        usage
    fi

    let new_brightness=$((${current_brightness} + ${1}))
    echo "${new_brightness}" | sudo tee ${target_folder}/brightness > /dev/null
}

decrease_by_value()
{
    if [ $((${current_brightness} - ${1})) -lt 1 ]; then
        echo "Already on minimum brightness. Try a smaller number or -s instead."

        usage
    fi

    let new_brightness=$((${current_brightness} - ${1}))
    echo "${new_brightness}" | sudo tee ${target_folder}/brightness > /dev/null
}

if [ $# -gt 2 ] || [ $# -eq 0 ]
then
    usage
fi

# get options
options=":hvgsid"
getopts ${options} args

case ${args} in
    h)
        usage

        ;;
    v)
        echo "llight 1.0"
        echo "Developed by Josue Teodoro Moreira"

        ;;
    g)
        echo ${current_brightness}

        ;;
    s)
        set_by_value ${2}

        ;;
    i)
        increase_by_value ${2}

        ;;
    d)
        decrease_by_value ${2}

        ;;
    *)
        echo "Invalid argument -${OPTARG}"
        echo
        usage

        ;;
esac


exit 0
