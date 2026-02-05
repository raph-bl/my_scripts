#!/bin/bash

# TODO: Exit status echo
status=$?
RED='\033[0;31m'
NC='\033[0m' # No Color
RED="31"
GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"
ENDCOLOR="\e[0m"

# echo -e "${BOLDGREEN}Behold! Bold, green text.${ENDCOLOR}"
# echo -e "${ITALICRED}Italian italics${ENDCOLOR}"

if [ $1 == "error" ]; then
    echo -e "${BOLDGREEN}(!) ${ENDCOLOR}Compilation avec les flags mouli"
    gcc -W -Wall $1
elif [ $1 == "lib" ]; then
    echo -e "${BOLDGREEN}(!) ${ENDCOLOR}Compilation avec la lib."
    gcc -W -Wall $2 -I./include -L./lib -lmy
elif [ $1 == "help" ]; then
    echo -e "Utilisation: compilz [OPTION]"
    echo -e "Compiler les fichiers vers la sortie standard"
    echo -e "\n"
    echo -e "Pas d'arg  :           Compile *.c"
    echo -e "error      :           Compile *.c avec les flags '-W -Wall'."
    echo -e "lib        :           Compile *.c avec la lib au chemin standard"
    echo -e "help       :           Affiche ce menu."
else
    echo -e "${BOLDGREEN} (!) ${ENDCOLOR}Compilation normale"
    gcc *.c
fi
