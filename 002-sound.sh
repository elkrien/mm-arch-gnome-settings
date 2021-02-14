#!/bin/bash
#set -e
#################################################################################
#										#
#										#
# Opis		:	Skrypt do instalacji dźwięku				#
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
echo " 			INSTALOWANIE DŹWIĘKU"
echo 
echo "###############################################################################"
echo
tput sgr0


### Lista pakietów do zainstalowania

list=(
pulseaudio		# serwer dźwięku
pulseaudio-alsa		# konfigurator dla Pulseaudio
pavucontrol		# kontrola głośności dla Pulseaudio
alsa-firmware		# firmware dla alsa
alsa-lib		# sterowniki dla dźwięku
alsa-plugins		# dodatkowe pluginy alsa
alsa-utils		# narzędzia alsa
gstreamer		# środowisko dla dźwięku
gst-plugins-good	# plugin dla gst
gst-plugins-bad		# plugin dla gst
gst-plugins-base	# plugin dla gst
gst-plugins-ugly	# plugin dla gst
playerctl		# kontroler media dla spotify, vlc i innych
)


### Wywołanie skryptu

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "### Instalowanie pakietu nr.  "$count " " $name;tput sgr0;
	func_install $name
	echo
done

### Powiadomienie o zakończeniu

tput setaf 11;
echo
echo "###############################################################################"
echo
echo "			DŹWIĘK ZOSTAŁ ZAINSTALOWANY"
echo
echo "###############################################################################"
echo;tput sgr0
