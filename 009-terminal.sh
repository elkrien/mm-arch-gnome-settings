#!/bin/bash
#set -e
#################################################################################
#										#
#										#
# Opis		:	Skrypt do instalacji i zmiany wyglądu Terminala		#
#		:								#
# Author	:	Maciej Młocek (thx to Eric Dubois from Arcolinux)	#
#										#
#										#
#################################################################################


#### Funkcja do instalacji

# Funkcja do instalacji z oficjalnych repo

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

# Funkcja do instalacji z repo użytkowników AUR

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
kitty			# terminal
fish			# shell
starship		# prompt
)

list_paru=(
)


### Wywołanie skryptu

# instalacja odpowiednich programów

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

# zmiana shell

echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /bin/fish

# kopiowanie ustawień fish

mkdir -p ~/.config/fish
cp -r ./Config-files/config.fish ~/.config/fish/
mkdir -p ~/.config/fish/conf.d
cp -r ./Config-files/dracula.fish ~/.config/fish/conf.d/

# kopiowanie ustawień kitty

mkdir -p ~/.config/kitty
cp -r ./Config-files/dracula.conf ~/.config/kitty/
cp -r ./Config-files/diff.conf ~/.config/kitty/
cp -r ./Config-files/kitty.conf ~/.config/kitty/

# kopiowanie ustawień starship

cp -r ./Config-files/starship.toml ~/.config/

### Powiadomienie o zakończeniu

tput setaf 11;
echo
echo "###############################################################################"
echo
echo "			APLIKACJE ZOSTAŁY ZAINSTALOWANE"
echo "		  SHELL ZOSTAŁ ZMIENIONY NA FISH + STARSHIP"
echo "		ABY DOKOŃCZYĆ ZRESTARTUJ KOMPUTER (sudo reboot)"
echo
echo "###############################################################################"
echo;tput sgr0
