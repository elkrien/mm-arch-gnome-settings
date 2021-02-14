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
echo " 			INSTALOWANIE OBSŁUGI DRUKAREK"
echo 
echo "###############################################################################"
echo
tput sgr0


### Lista pakietów do zainstalowania

list=(
cups				# The CUPS Printing System - daemon
cups-pdf			# PDF printer for cups
ghostscript			# An interpreter for the PostScript language
gsfonts				# (URW)++ Core Font Set [Level 2]
gutenprint			# Top quality printer drivers for POSIX systems
gtk3				# GObject-based multi-platform GUI toolkit
libcups				# The CUPS Printing System - client libraries and headers
system-config-printer 		# A CUPS printer configuration tool and status applet
nss-mdns			# glibc plugin providing host name resolution via mDNS
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
echo "Uruchamianie serwisu drukarek"
echo 
echo;tput sgr0
sudo systemctl enable cups.service

### Instalacja sterowników drukarki

tput setaf 5;echo
echo "Instalowanie sterowników drukarki Epson"
echo 
echo;tput sgr0
paru -S --noconfirm --needed epson-inkjet-printer-escpr


### Powiadomienie o zakończeniu

tput setaf 11;
echo
echo "###############################################################################"
echo
echo "			OBSŁUGA DRUKAREK ZOSTAŁA ZAINSTALOWANA"
echo
echo "###############################################################################"
echo;tput sgr0
