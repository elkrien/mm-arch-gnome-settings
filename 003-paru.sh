#!/bin/bash
#set -e
#################################################################################
#										#
#										#
# Opis		:	Skrypt do instalacji obsługi drukarek			#
#		:								#
# Author	:	Maciej Młocek (thx to Eric Dubois from Arcolinux)	#
#										#
#										#
#################################################################################


### Nagłówek

tput setaf 3
echo
echo "###############################################################################"
echo
echo " 			INSTALOWANIE PARU DO INSTALACJI PAKIETÓW AUR"
echo 
echo "###############################################################################"
echo
tput sgr0

### Wywołanie skryptu

mkdir -p "$HOME/GitHub"
cd "$HOME/GitHub"
sudo pacman -S --noconfirm --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# aktualizacja repozytoriów

paru -Sy

### Powiadomienie o zakończeniu

tput setaf 11;
echo
echo "###############################################################################"
echo
echo "			PARU ZOSTAŁO ZAINSTALOWANE"
echo " 	  uruchom sudo nano /etc/paru.conf i aktywuj BottomUp "
echo
echo "###############################################################################"
echo;tput sgr0
