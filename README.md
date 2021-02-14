# ARCH GNOME na IDEAPAD 100S-14IBR

Repozytorium zawiera skrypty oraz ustawienia Linux Arch z środowiskiem GNOME w moim własnym wydaniu. 

System i jego wygląd oczywiście jest dostosowany do moich osobistych preferencji na moim komputerze ale spokojnie powinien działać na każdym innym - nie powinno wymagać to wielu poprawek (obstawiam, że wszystko będzie działać "out of the box", ewentualnie można dodatkowo doinstalować odpowiednie sterowniki karty graficznej)

![](https://github.com/elkrien/mm-arch-gnome-settings/blob/main/Config-files/GNOME-pulpit.png?raw=true)

INSTRUKCJA INSTALACJI:

1. Zainstaluj Arch Linux wg instrukcji zawartej w pliku *arch-install-step-by-step.md*

2. Zaktualizuj system:

   ```sh
   sudo update -Syu
   ```

5. Sklonuj i skonfiguruj repozytorium z skryptami konfiguracyjnymi za pomocą poleceń:

   ```sh
   sudo pacman -S --needed git
   mkdir ~/GitHub
   cd ~/GitHub/
   git clone https://github.com/elkrien/mm-arch-gnome-settings.git
   cd mm-arch-xfce-settings/
   ./git-setup.sh
   ```

4. Uruchom następujące skrypty:

   Instalacja środowiska graficznego GNOME (możesz ale nie musisz restartować komputera):

   ```sh
    ./001-gnome-environment.sh
    sudo reboot
   ```

   Instalacja sterowników i pluginów do obsługi dźwięku:

   ```sh
   ./002-sound.sh
   ```

   Instalacja paru (programu do instalacji pakietów z repozytoriów AUR użytkowników):

   ```sh
   ./003-paru.sh
   ```

   Instalacja sterowników i serwisów do obsługi drukarek:

   ```sh
   ./004-printers.sh
   ```

   Instalacja programu i serwisu do zarządzania zasilaniem i baterią laptopa:

   ```sh
   ./005-laptop.sh
   ```

   Instalacja serwisów sieciowych (m.in. samba, avahi):

   ```sh
    ./006-network-discovery.sh
   ```

   Instalacja czcionek:

   ```sh
   ./007-fonts.sh
   ```

   Instalacja aplikacji:

   ```sh
    ./008-applications.sh
   ```

   Instalacja terminala, zmiana shell i dostosowanie jego wyglądu:

   ```sh
    ./009-terminal.sh
   ```

   Instalacja bluetooth (opcjonalnie):

   ```sh
   ./010-bluetooth.sh
   ```

   Instalacja motywów, czcionek i kolorów

   ```sh
   ./011-themes.sh
   ```

5. Uruchom ponownie komputer

   ```sh
   sudo reboot
   ```

6. Wyczyść cache po wszyskich instalacjach:

   ```sh
   sudo pacman -Sc
   ```

7. Przejdź do zabawy z dostosowaniem wyglądu systemu i aplikacji wg pliku GNOME-themes.md



 
