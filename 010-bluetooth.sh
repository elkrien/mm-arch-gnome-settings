#!/bin/bash
#set -e
#################################################################################
#										#
#										#
# Opis		:	Skrypt do instalacji obsługi Bluetooth			#
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
echo " 			INSTALOWANIE OBSŁUGI BLUETOOTH"
echo 
echo "###############################################################################"
echo
tput sgr0


### Lista pakietów do zainstalowania

list=(
pulseaudio-bluetooth		# Bluetooth support for PulseAudio
bluez				# Daemons for the bluetooth protocol stack
bluez-libs			# Deprecated libraries for the bluetooth protocol stack
bluez-utils			# Development and debugging utilities for the bluetooth protocol stack
blueberry			# Bluetooth configuration tool
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
echo "Uruchamianie serwisu Bluetooth"
echo 
echo;tput sgr0
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf


### Powiadomienie o zakończeniu

tput setaf 11;
echo
echo "###############################################################################"
echo
echo "			OBSŁUGA BLUETOOTH ZOSTAŁA ZAINSTALOWANA"
echo
echo "###############################################################################"
echo;tput sgr0
