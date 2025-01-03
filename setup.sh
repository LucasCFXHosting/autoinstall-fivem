#!/bin/bash

red="$(tput setaf 1)"
yellow="$(tput setaf 3)"
green="$(tput setaf 2)"
nc="$(tput sgr0)"

echo -e "${green}"
echo -e" #######   ####    ##   ##  #######  ##   ##   #####   ##   ##   ####    #######  ####     #####             ##   ##  #######  ######  "
echo -e"  ##   #    ##     ##   ##   ##   #  ### ###  ##   ##  ##   ##    ##      ##   #   ##       ## ##            ###  ##   ##   #  # ## #  "
echo -e"  ## #      ##      ## ##    ## #    #######  #        ##   ##    ##      ## #     ##       ##  ##           #### ##   ## #      ##    "
echo -e"  ####      ##      ## ##    ####    #######   #####   #######    ##      ####     ##       ##  ##           ## ####   ####      ##    "
echo -e"  ## #      ##       ###     ## #    ## # ##       ##  ##   ##    ##      ## #     ##   #   ##  ##           ##  ###   ## #      ##    "
echo -e"  ##        ##       ###     ##   #  ##   ##  ##   ##  ##   ##    ##      ##   #   ##  ##   ## ##     ##     ##   ##   ##   #    ##    "
echo -e" ####      ####       #     #######  ##   ##   #####   ##   ##   ####    #######  #######  #####      ##     ##   ##  #######   ####   "
                                                                                                                                       

echo -e "${reset}"

echo -e "${bold}${green}Bienvenue dans le script d'installation automatique de FiveMShield !${reset}"
echo -e "${bold}Ce script configure rapidement votre serveur FiveM avec nos solutions de sécurité.${reset}\n"

curl --version
if [[ $? == 127  ]]; then  apt -y install curl; fi

clear

status(){
  clear
  echo -e $green$@'...'$reset
  sleep 1
}

source <(curl -s https://raw.githubusercontent.com/JulianGransee/BashSelect.sh/main/BashSelect.sh)

export OPTIONS=("install FiveM" "update FiveM" "do nothing") #"install MySQl/MariaDB + PHPMyAdmin"

bashSelect

case $? in
     0 )
        install=true;;
     1 )
        install=false;;
     2 )
        exit 0
esac

# Runtime Version 
status "Select a runtime version"
readarray -t VERSIONS <<< $(curl -s https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/ | egrep -m 3 -o '[0-9].*/fx.tar.xz')

latest_recommended=$(echo "${VERSIONS[0]}" | cut -d'-' -f1)
latest=$(echo "${VERSIONS[2]}" | cut -d'-' -f1)

export OPTIONS=("latest version -> $latest" "latest recommended version -> $latest_recommended" "choose custom version" "do nothing")

bashSelect

case $? in
     0 )
        runtime_link="https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${VERSIONS[2]}";;
     1 )
        runtime_link="https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${VERSIONS[0]}";;
     2 )
        clear
        read -p "Enter the download link: " runtime_link
        ;;
     3 )
        exit 0
esac

if [[ $install == true ]]; then
  bash <(curl -s https://raw.githubusercontent.com/Twe3x/fivem-installer/main/install.sh) $runtime_link
else
  bash <(curl -s https://raw.githubusercontent.com/Twe3x/fivem-installer/main/update.sh) $runtime_link
fi