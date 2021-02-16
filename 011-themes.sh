#!/bin/bash
#set -e
#################################################################################
#										#
#										#
# Opis		:	Skrypt do instalacji tematów Ant Dracula do GNOME	#
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
echo " 			INSTALOWANIE APLIKACJI / MOTYWÓW"
echo 
echo "###############################################################################"
echo
tput sgr0


### Lista pakietów do zainstalowania

list=(
)

list_paru=(
ant-dracula-gtk-theme			# motyw Ant Dracula do XFCE
kora-icon-theme				# ikony kora dla XFCE
bibata-cursor-theme-bin			# kursory myszy
)


### Wywołanie skryptu

paru -Sy

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


# temat dla micro

mkdir -p ~/.config/micro/colorschemes
cp -r ./Config-files/dracula.micro ~/.config/micro/colorschemes

# temat dla typora

mkdir -p ~/.config/Typora/themes/
cp -R ./Config-files/dracula ~/.config/Typora/themes/
cp -R ./Config-files/dracula.css ~/.config/Typora/themes/

# temat dla wget

mkdir -p ~/.local/share/gedit/styles/
cp ./Config-files/dracula.xml ~/.local/share/gedit/styles/

# temat dla libreoffice

cp ./Config-files/dracula.soc ~/.config/libreoffice/*/user/config/

# ustawianie ikon, czcionek i kolorów

gsettings set org.gnome.desktop.interface gtk-theme "Ant-Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Ant-Dracula"
gsettings set org.gnome.desktop.interface icon-theme "kora"
gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Original-Amber"
gsettings set org.gnome.desktop.interface document-font-name "Ubuntu 11"
gsettings set org.gnome.desktop.interface font-name "Ubuntu 11"
gsettings set org.gnome.desktop.interface monospace-font-name "Roboto Mono 11"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Ubuntu Bold 11"

# dodawanie opcji uruchamiania Kitty w Nautilus

gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty

### Powiadomienie o zakończeniu

tput setaf 11;
echo
echo "###############################################################################"
echo
echo "			MOTYWY ZOSTAŁY ZOSTAŁY ZAINSTALOWANE"
echo "		     POSTĘPUJ ZGODNIE Z KOLEJNYMI INSTRUKCJAMI"
echo
echo "###############################################################################"
echo;tput sgr0
