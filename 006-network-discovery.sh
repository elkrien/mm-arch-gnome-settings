#!/bin/bash
#set -e
#################################################################################
#										#
#										#
# Opis		:	Skrypt do instalacji serwisów sieciowych		#
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
echo " 			INSTALOWANIE SERWISÓW SIECIOWYCH"
echo 
echo "###############################################################################"
echo
tput sgr0


### Lista pakietów do zainstalowania

list=(
avahi
nss-mdns
gvfs-smb
)

count=0

### Wywołanie skryptu

# Instalowanie pakietów
for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

# Ustawianie nsswitch.conf

tput setaf 5;echo
echo "Zmiana nsswitch.conf aby uaktywnić sieć"
echo 
echo;tput sgr0

#first part
sudo sed -i 's/files mymachines myhostname/files mymachines/g' /etc/nsswitch.conf
#last part
sudo sed -i 's/\[\!UNAVAIL=return\] dns/\[\!UNAVAIL=return\] mdns dns wins myhostname/g' /etc/nsswitch.conf



# Wyłączanie systemd-resolved - który gryzie się z avahi
tput setaf 5;echo
echo "Wyłączanie serwisu systemd-resolved"
echo 
echo;tput sgr0
sudo systemctl disable systemd-resolved.service 

# Włączanie serwisów sieciowych avahi

tput setaf 5;echo
echo "Uruchamianie serwisu avahi"
echo 
echo;tput sgr0
sudo systemctl enable avahi-daemon.service


### KOMUNIKAT KOŃCOWY

tput setaf 11;
echo
echo "###############################################################################"
echo
echo "			SERWISY SIECIOWE ZOSTAŁY ZAINSTALOWANE"
echo "		zrestartuj komputer aby uaktywnić zmiany (sudo reboot)"
echo
echo "###############################################################################"
echo;tput sgr0
