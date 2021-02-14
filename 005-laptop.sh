#!/bin/bash
#set -e
#################################################################################
#										#
#										#
# Opis		:	Skrypt do instalacji TLP (Laptop Power)			#
#		:								#
# Author	:	Maciej Młocek (thx to Eric Dubois from Arcolinux)	#
#										#
#										#
#################################################################################


#### Funkcja do instalacji

func_install() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
  		echo " 		  Pakiet "$1" jest już zainstalowany				     "
		tput sgr0
	else
    		tput setaf 3
    		echo
    		tput sgr0
    		sudo pacman -S --noconfirm --needed $1
    	fi
}

### Nagłówek

tput setaf 3
echo
echo "###############################################################################"
echo
echo " 			INSTALOWANIE SERWISU TLP (LAPTOP)"
echo 
echo "###############################################################################"
echo
tput sgr0


### Lista pakietów do zainstalowania

list=(
tlp		# Zarządzanie baterią w laptopie
)


### Wywołanie skryptu

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "### Instalowanie pakietu nr.  "$count " " $name;tput sgr0;
	func_install $name
	echo
done

tput setaf 5;echo
echo "Uruchamianie serwisu TLP"
echo 
echo;tput sgr0
sudo systemctl enable tlp.service

tput setaf 11;
echo
echo "###############################################################################"
echo
echo "			SERWIS TLP ZOSTAŁ ZAINSTALOWANY"
echo
echo "###############################################################################"
echo;tput sgr0

