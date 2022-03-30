#!/bin/bash

GREEN="\e[32m"
YELLOW="\e[93m"
ENDCOLOR="\e[0m"

mkdir -p ~/.flasher
cp logo.txt ~/.flasher/logo.txt
cp flasher.sh ~/.flasher/flasher.sh
cp source.conf ~/.flasher/source.conf
echo "alias flash='~/.flasher/flasher.sh' >> ~/.bashrc >/dev/null"
echo "alias flash='~/.flasher/flasher.sh' >> ~/.zshrc >/dev/null"
echo "alias flash='~/.flasher/flasher.sh' >> ~/.config/fish/config.fish >/dev/null"

cat logo.txt
sleep 5
clear

echo -e "${YELLOW}WELCOME TO USB FLASHER APP${ENDCOLOR}"
echo -e "${GREEN}Hint: Next time if you want to run script just type 'flash' in your terminal${ENDCOLOR}"
echo -e "${GREEN}You can safely remove git directory of that app${ENDCOLOR}"
sleep 5
clear
echo -e "${YELLOW}Select ISO file${ENDCOLOR}"
filename="source.txt"
source source.txt
cd $SOURCE
ls -lah *.iso
read file
echo -e "${YELLOW}Select device to burn${ENDCOLOR}"
lsblk
read device
sudo umount /dev/${device} > /dev/null
sudo dd if=${file} | pv |sudo dd of=/dev/${device}

echo -e "${GREEN}Done${ENDCOLOR}"

cat logo.txt
