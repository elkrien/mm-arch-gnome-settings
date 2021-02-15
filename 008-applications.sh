#!/bin/bash
#set -e
#################################################################################
#										#
#										#
# Opis		:	Skrypt do instalacji oficjalnych pakietów		#
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

func_install_paru() {
	if paru -Qi $1 &> /dev/null; then
		tput setaf 2
  		echo " 		  Pakiet "$1" jest już zainstalowany				     "
		tput sgr0
	else
    		tput setaf 3
    		echo
    		tput sgr0
    		paru -S --noconfirm --needed $1
    	fi
}

### Nagłówek

tput setaf 3
echo
echo "###############################################################################"
echo
echo " 			INSTALOWANIE APLIKACJI"
echo 
echo "###############################################################################"
echo
tput sgr0


### Lista pakietów do zainstalowania

list=(
calibre			# manager ebook
gimp			# edytor grafiki
geary			# klient poczty
qbittorrent		# klient torrent
simplescreenrecorder	# do robienia filmów z pulpitu
kitty			# terminal
htop			# monitor systemu
neofetch		# informacje o systemie
gparted			# zarządzanie dyskami
grub-customizer		# customizer grub
fish			# shell
libreoffice-fresh	# pakiet office
libreoffice-fresh-pl	# Polski język do Libreoffice
gufw			# konfiguracja firewall
discord			# discord
intel-ucode		# Microcode update dla procesorów Intel
xclip			# schowek w edytorze micro
meld			# porównywarka plików
unzip			# rozpakowywanie archiwów
wget			# download from www in terminal
pragha			# odtwarzacz muzyki
)

list_paru=(
bitwarden-bin			# password manager
teams				# Microsoft Teams
zoom				# Zoom
skypeforlinux-stable-bin	# Skype
google-chrome			# przeglądarka www
timeshift-bin			# timeshift
etcher-bin			# flashowanie iso
pamac-aur			# instalator pakietów
nvm				# Node Version Manager
micro-bin			# edytor w terminalu
spotify				# serwis spotify
typora				# edytor plików MD
)


### Wywołanie skryptu

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "### Instalowanie pakietu nr.  "$count " " $name;tput sgr0;
	func_install $name
	echo
done

for name in "${list_paru[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "### Instalowanie pakietu nr.  "$count " " $name;tput sgr0;
	func_install_paru $name
	echo
done

### Powiadomienie o zakończeniu

tput setaf 11;
echo
echo "###############################################################################"
echo
echo "			APLIKACJE ZOSTAŁY ZAINSTALOWANE"
echo
echo "###############################################################################"
echo;tput sgr0
