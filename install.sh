#!/data/data/com.termux/files/usr/bin/bash -e

cd 2> /dev/null

if [ ! -f ../usr/bin/tamp ]; then
	pkg install git proot tar -y
	git clone https://github.com/KhanhNguyen9872/Tamp.git 2> /dev/null
	cd Tamp 2> /dev/null
	bash install.sh
	cd 2> /dev/null
	rm -rf Tamp 2> /dev/null
	echo "echo '(KhanhNguyen9872)'" >> ~/.bash_profile
	echo "echo 'phpmyadmin: tamp -start | tamp -stop'" >> ~/.bash_profile
	echo "echo ''" >> ~/.bash_profile
	clear
fi

function ask() {
    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        printf "${light_cyan}\n[?] "
        read -p "$1 [$prompt] " REPLY

        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        printf "${reset}"

        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}

function get_arch() {
    clear
    printf "${blue}[*] Kiem tra CPU...."
    case $(getprop ro.product.cpu.abi) in
        arm64-v8a)
            SYS_ARCH=arm64
			printf " ARCH: $(getprop ro.product.cpu.abi) (aarch64)"
            ;;
        armeabi|armeabi-v7a)
			printf " ARCH: $(getprop ro.product.cpu.abi) (armhf)"
			printf " @ Unsupported CPU"
			exit 1
            ;;
        *)
			printf " ARCH: $(getprop ro.product.cpu.abi) (unknown))"
			printf "\n\n\n @ Unsupported CPU \n\n"
			exit 1
            ;;
    esac
}

function set_strings() {
    CHROOT="ubuntu-fs"
    IMAGE_NAME="image-khanhnguyen9872.tar.xz"
    SHA_NAME="image-khanhnguyen9872.sha512sum"
}    

function cleanup() {
    if [ -f ${IMAGE_NAME} ]; then
		rm -f ${IMAGE_NAME}
        rm -f ${SHA_NAME}
		printf " - Da cai dat xong!"
    fi
} 

function get_url() {
    ROOTFS_URL="https://github.com/KhanhNguyen9872/Ninja_Server_Termux/releases/download/NinjaServerTermuxv01/image-khanhnguyen9872.img"
    SHA_URL="https://github.com/KhanhNguyen9872/Ninja_Server_Termux/releases/download/NinjaServerTermuxv01/image-khanhnguyen9872.sha512sum"
}

function get_rootfs() {
    unset KEEP_IMAGE
    if [ -f ${IMAGE_NAME} ]; then
        rm -f ${IMAGE_NAME}
    fi
    split_file=0
    if [[ $split_file -eq 0 ]]; then
    	printf "${blue}[*] Dang tai (arm64)...."
    	printf " (410MB)${reset}\n\n"
    	get_url
    	wget -O image-khanhnguyen9872.img "$ROOTFS_URL" && echo "- Get success"
    fi
}

function get_sha() {
    if [ -f ${SHA_NAME} ]; then
		rm -f ${SHA_NAME}
    fi
    wget -O image-khanhnguyen9872.sha512sum "${SHA_URL}" 2> /dev/null
}

function verify_sha() {
	clear
    printf "\n${blue}[*] Dang kiem tra file cai dat....${reset}\n"
    sha512sum -c $SHA_NAME || {
        printf "${red} File cai dat bi hong. Vui long cai lai \n${reset}"
	    rm -f $SHA_NAME 2> /dev/null
	    rm -f $IMAGE_NAME 2> /dev/null
	    rm -f install-kali-khanhnguyen 2> /dev/null
	    rm -f update-kali-khanhnguyen 2> /dev/null
        exit 1
    }
	rm -f $SHA_NAME
}

function extract_rootfs() {
        printf "\n${blue}[*] Dang cai dat (arm64).... ${reset}\n"
		printf "\n${blue}    @@ Qua trinh co the mat kha nhieu thoi gian @@ ${reset}\n"
		printf "\n${red}             @@ Tam 4-8 phut @@ ${reset}\n\n"
		mv image-khanhnguyen9872.img image-khanhnguyen9872.tar.xz
        proot --link2symlink tar -xJf $IMAGE_NAME 2> /dev/null || :
		rm -f $IMAGE_NAME
        wget -O menu.sh https://raw.githubusercontent.com/KhanhNguyen9872/Ninja_Server_Termux/main/menu.sh 2> /dev/null
        wget -O ninja.sh https://github.com/KhanhNguyen9872/Ninja_Server_Termux/blob/main/CONF_FILE/ninja.sh 2> /dev/null
        mv menu.sh ~/../usr/bin/menu && chmod 777 ~/../usr/bin/menu
        mv ninja.sh ~/../usr/bin/ninja && chmod 777 ~/../usr/bin/ninja
        wget -O index.php https://raw.githubusercontent.com/KhanhNguyen9872/Ninja_Server_Termux/main/khanh/index.php 2> /dev/null
        wget -O index_2.php https://raw.githubusercontent.com/KhanhNguyen9872/Ninja_Server_Termux/main/khanh/phpMyAdmin/index.php 2> /dev/null
        rm -rf ~/../usr/share/apache2/default-site/htdocs && mkdir ~/../usr/share/apache2/default-site/htdocs && mkdir ~/../usr/share/apache2/default-site/htdocs/phpMyAdmin
        mv index.php ~/../usr/share/apache2/default-site/htdocs/index.php
        mv index_2.php ~/../usr/share/apache2/default-site/htdocs/phpMyAdmin/index.php
}

function installapp_khanh() {
    cd 2> /dev/null
    rm -rf /sdcard/tmp 2> /dev/null
    wget -O J2ME-Loader.apk "https://github.com/KhanhNguyen9872/Ninja_Server_Termux/blob/main/J2ME-Loader.apk?raw=true" 2> /dev/null
    wget -O ninja.7z "https://github.com/KhanhNguyen9872/Ninja_Server_Termux/blob/main/ninja.7z?raw=true" 2> /dev/null
    7z x ninja.7z 2> /dev/null
    if [ ! -d /sdcard/J2ME-Loader ]; then
        mv J2ME-Loader /sdcard 2> /dev/null
    else
        rm -rf "/sdcard/J2ME-Loader/converted/NSO 148 Pro_8a918de1"
        mv "J2ME-Loader/converted/NSO 148 Pro_8a918de1" /sdcard/J2ME-Loader/converted
    fi
    clear
    echo ""
    echo "Is anyone here? (Co ai o day khong?)"
    read -p "Press Enter to continue!" anykey
    mkdir /sdcard/tmp 2> /dev/null
    mv J2ME-Loader.apk /sdcard/tmp/J2ME-Loader.apk 2> /dev/null
    echo ""
    printf " Installing J2ME-Loader....."
    echo ""
    termux-open /sdcard/tmp/J2ME-Loader.apk
    read -p "Press Enter to continue!" anykey
    rm -rf /sdcard/tmp
}

function completed() {
	clear
	echo "- Da cai dat thanh cong"
	echo ""
}

##################################
##              Main            ##

red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'

cd $HOME
get_arch
set_strings
get_rootfs
get_sha
verify_sha
extract_rootfs
installapp_khanh
completed
rm -f ~/install.sh
exit 0
