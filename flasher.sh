#!/bin/bash

GREEN="\e[32m"
YELLOW="\e[93m"
ENDCOLOR="\e[0m"

echo -e "${YELLOW}WELCOME TO USB FLASHER APP${ENDCOLOR}"
echo '.'
echo '.'
echo '.'
echo '.'
echo '.'
echo '.'
echo '.'
echo -e "${YELLOW}Select ISO file${ENDCOLOR}"
filename="source.txt"
source source.txt
cd $SOURCE
ls *.iso
read file
echo -e "${YELLOW}Select device to burn${ENDCOLOR}"
lsblk
read device
sudo umount /dev/${device} > /dev/null
sudo dd if=${file} | pv |sudo dd of=/dev/${device}

echo -e "${GREEN}Done${ENDCOLOR}"
