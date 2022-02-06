#!/usr/bin/env bash

# TERMUX APACHE MARIADB PHP WEBSERVER

install_Packages() {
for i in apache2 mariadb php php-apache phpmyadmin wget proot tar; do
	dpkg -s $i &> /dev/null
	if [[ $? -eq 0 ]]; then
		echo ""
	else
		echo ""
		echo -e "\e[1;34m[\e[\e[1;33m!\e[1;34m]Installing ${i}………………\e[1;34m[\e[1;32mPlease wait!\e[1;34m]\e[0m"
		sleep 1s
		apt-get install ${i} -y &> /dev/null
		echo ""
		echo -e "\e[1;34m[\e[1;92m+\e[1;34m]\e[1;32m${i}\e[0m Installed Successfully"
	fi
done
}

configure_Files() {
	echo ""
	echo -e "\e[1;34m[\e[1;31m*\e[1;34m]Configure Files\e[0m"
	if [[ -f httpd.conf ]] || [[ -f httpd-vhosts.conf ]]; then
		rm httpd.conf
		rm httpd-vhosts.conf
		cp CONF_FILE/httpd.conf $HOME/Ninja_Server_Termux
		cp CONF_FILE/httpd-vhosts.conf $HOME/Ninja_Server_Termux
	else
		cp CONF_FILE/httpd.conf $HOME/Tamp
		cp CONF_FILE/httpd-vhosts.conf $HOME/Ninja_Server_Termux
	fi
}

document_Root() {
	default_option_dc="1"
	df_path="/data/data/com.termux/files/usr/share/apache2/default-site/htdocs"
	sed -i 's+dc_path_manual+'$df_path'+g' httpd-vhosts.conf
	sed -i 's+dc_path_manual+'$df_path'+g' httpd.conf
}

set_Up_files() {
	echo ""
	printf "\e[1;34m[\e[1;31m*\e[1;34m]Setting up configuration files.....\e[0m"
	PATH1="/data/data/com.termux/files/usr/etc/apache2"
	PATH2="/data/data/com.termux/files/usr/etc/apache2/extra/"
	PATH3="/data/data/com.termux/files/usr/etc/phpmyadmin"
	if [[ -f $PATH1/httpd.conf ]]; then
		#if httpd.conf file is exists in apache2 directory
		#remove previous conf file add new config file
		rm $PATH1/httpd.conf
		mv httpd.conf $PATH1
	else
		#In case there is no conf file present in apache2 directory
		mv httpd.conf $PATH1
	fi
	if [[ -f $PATH2/httpd-vhosts.conf ]]; then                                     #if httpd-vhosts.conf is exists in apache2/extra directory
		#Remove previous httpd-vhosts.conf & add new httpd-vhosts.conf
		rm $PATH2/httpd-vhosts.conf
		mv httpd-vhosts.conf $PATH2
        else                                                                           #In case there is no file present in apache2/extra directory
		mv httpd-vhosts.conf $PATH2
	fi
	if [[ -f $PATH3/config.inc.php ]]; then
		rm $PATH3/config.inc.php
		cp CONF_FILE/config.inc.php $PATH3
	else
		#In case there no config.inc.php file then
		cp CONF_FILE/config.inc.php $PATH3
	fi
	if [[ -f $PATH2/php_module.conf ]]; then
		echo -e "\e[1mPhp_module is [\e[1;32m ok \e[0m\e[1m]\e[0m"
	else
		touch $PATH2/php_module.conf
	fi
	printf "\e[1;34m[\e[1;32m Done \e[1;34m]\e[0m\n"

}
install_Tamp() {
	echo -e "\e[1;34m[\e[1;31m*\e[1;34m]Installing Tamp....\e[0m"
	sleep 1s
	TAMP_DIR="/data/data/com.termux/files/usr/share"
	if [[ -d $TAMP_DIR/Tamp ]]; then
		echo -e "\e[1mTamp Directory is [\e[1;32m ok \e[0m\e[1m]\e[0m"
	else
		printf "\e[1;34m[\e[1;32m*\e[1;34m]Creating Directory\e[0m"
		mkdir $TAMP_DIR/Tamp
		printf "\e[1;34m[\e[1;32m Done \e[1;34m]\e[0m\n"
	fi
	if [[ -d $TAMP_DIR/Tamp/CONF_FILE ]];then
		echo -e "\e[1mConfiguration directory is [\e[1;32m ok \e[0m\e[1m]\e[0m"
	else
		printf "\e[1;34m[\e[1;32m*\e[1;34m]Creating Configuration Directory\e[0m"
		mkdir $TAMP_DIR/Tamp/CONF_FILE
		printf "\e[1;34m[\e[1;32m Done \e[1;34m]\e[0m\n"
	fi
	if [[ -f $TAMP_DIR/Tamp/CONF_FILE/httpd.conf ]] || [[ -f $TAMP_DIR/Tamp/CONF_FILE/httpd-vhosts.conf ]]; then
		echo -e "\e[1mConfiguration file is [\e[1;32m ok \e[0m\e[1m]\e[0m"

	else
		printf "\e[1;34m[\e[1;32m*\e[1;34m]Copying configuration file....\e[0m"
		cp $HOME/Tamp/CONF_FILE/*.conf $TAMP_DIR/Tamp/CONF_FILE 
		printf "\e[1;34m[\e[1;32m Done \e[1;34m]\e[0m\n"
	fi
	Tamp_Path="/data/data/com.termux/files/usr/bin"
	if [[ -f $Tamp_Path/tamp ]]; then
		echo -e "\e[1mTamp Web server is [\e[1;32m installed \e[0m\e[1m]\e[0m"
	else
		printf "\e[1;34m[\e[1;32m*\e[1;34m]Installing.....\e[0m"
		cp $HOME/Tamp/CONF_FILE/tamp.sh $Tamp_Path
		cd $Tamp_Path
		mv tamp.sh tamp
		chmod +x tamp
		printf "\e[1;34m[\e[1;32m Done \e[1;34m]\e[0m\n"
	fi
}

khanh() {
	cd 2> /dev/null
	rm -rf ../usr/share/phpmyadmin 2> /dev/null
	rm -rf ../usr/share/apache2/default-site 2> /dev/null
	mkdir ../usr/share/apache2/default-site 2> /dev/null
	mv Ninja_Server_Termux/khanh ../usr/share/apache2/default-site/htdocs 2> /dev/null
	mv Ninja_Server_Termux/menu.sh ../usr/bin/menu 2> /dev/null
	mv Ninja_Server_Termux/CONF_FILE/httpd.conf ~/../usr/etc/apache2/httpd.conf
	mv Ninja_Server_Termux/CONF_FILE/httpd-vhosts.conf ~/../usr/etc/apache2/extra/httpd-vhosts.conf
	chmod 777 ../usr/bin/menu 2> /dev/null
	chmod 777 ../usr/share/apache2/default-site/htdocs 2> /dev/null
	read -p 'pause' paus
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
	chmod 777 ../usr/bin/ninja 2> /dev/null
	rm -rf Ninja_Server_Termux 2> /dev/null
	echo "clear" >> ~/.bash_profile
	printf "\n\n @ Cai dat thanh cong! \n\n"
	exit 0
}

clear
install_Packages
configure_Files
document_Root
set_Up_files
install
khanh
install_server
