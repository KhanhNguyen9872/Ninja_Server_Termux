#!/usr/bin/env bash

khanh() {
	cd 2> /dev/null
	mv Ninja_Server_Termux/menu.sh ../usr/bin/menu 2> /dev/null
	chmod 777 ../usr/bin/menu 2> /dev/null
}

install_server() {
	clear
	echo " - Dang tai ve...."
	cd 2> /dev/null
	wget -O image-khanhnguyen9872.img "https://github.com/KhanhNguyen9872/Ninja_Server_Termux/releases/download/NinjaServerTermuxv01/image-khanhnguyen9872.img"
	wget -O image-khanhnguyen9872.sha512sum "https://github.com/KhanhNguyen9872/Ninja_Server_Termux/releases/download/NinjaServerTermuxv01/image-khanhnguyen9872.sha512sum"
	clear
	echo " - Dang kiem tra.... "
	sha512sum -c image-khanhnguyen9872.sha512sum || {
            printf "${red} File cai dat bi hong. Vui long cai lai \n${reset}"
	    rm -f image-khanhnguyen9872.img 2> /dev/null
	    rm -f image-khanhnguyen9872.sha512sum 2> /dev/null
            exit 1
        }
	printf "\n - Dang cai dat...."
	mkdir ../usr/share/KhanhNguyen9872 2> /dev/null
	mv image-khanhnguyen9872.img ../usr/share/KhanhNguyen9872/image-khanhnguyen9872.tar.xz 2> /dev/null
	cd ../usr/share/KhanhNguyen9872 2> /dev/null
	proot --link2symlink tar -xJf image-khanhnguyen9872.tar.xz 2> /dev/null || :
	rm -f image-khanhnguyen9872.tar.xz 2> /dev/null
	cd 2> /dev/null
	mv Ninja_Server_Termux/CONF_FILE/ninja.sh ../usr/bin/ninja 2> /dev/null
	mv Ninja_Server_Termux/ninja.jar /sdcard 2> /dev/null
	chmod 777 ../usr/bin/ninja 2> /dev/null
	rm -rf Ninja_Server_Termux 2> /dev/null
	rm -rf Tamp 2> /dev/null
	echo "clear" >> ~/.bash_profile
	printf "\n\n @ Cai dat thanh cong! \n\n"
	printf " - Location ninja.jar: /sdcard/ninja.jar \n\n"
	exit 0
}

preparing() {
	git clone https://github.com/KhanhNguyen9872/Tamp.git 2> /dev/null
	cd Tamp 2> /dev/null && bash install.sh
}

clear
preparing
khanh
install_server
