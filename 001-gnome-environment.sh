#!/bin/bash
#set -e
#################################################################################
#										#
#										#
# Opis		:	Skrypt do instalacji środowiska GNOME i GDM		#
#		:								#
# Author	:	Maciej Młocek (thx to Eric Dubois from Arcolinux)	#
#										#
#										#
#################################################################################


############ Funkcja do instalacji

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

############ Nagłówek

tput setaf 3
echo
echo "###############################################################################"
echo
echo " 			INSTALOWANIE ŚRODOWISKA GNOME"
echo 
echo "###############################################################################"
echo
tput sgr0

############ Lista pakietów do zainstalowania

list=(
xf86-video-intel
xorg
gnome
gnome-tweaks
nautilus-sendto
gnome-nettool
gnome-usage
adwaita-icon-theme
chrome-gnome-shell
xdg-user-dirs-gtk
arc-gtk-theme
gdm
)

############ Wywołanie skryptu

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Instalowanie pakietu nr.  "$count " " $name;tput sgr0;
	func_install $name
	echo
done


tput setaf 5;echo
echo "Ustawianie GDM jako środowiska systemowego"
echo 
echo;tput sgr0
sudo systemctl enable gdm

#tput setaf 2;echo "################################################################"
#echo "Removing packages we do not want"
#echo "################################################################"
#echo;tput sgr0
#sudo pacman -R xfce4-artwork xfce4-screensaver --noconfirm

############ Powiadomienie o zakończeniu

tput setaf 11;
echo
echo "###############################################################################"
echo
echo "			ZAINSTALOWANO ŚRODOWISKO GNOME"
echo
echo " 		Uruchom ponownie komputer (komenda: reboot)"
echo
echo "###############################################################################"
echo;tput sgr0


