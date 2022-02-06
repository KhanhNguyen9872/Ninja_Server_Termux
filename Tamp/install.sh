#!/usr/bin/env bash

install_Packages() {
for i in apache2 mariadb php php-apache phpmyadmin; do
	dpkg -s $i &> /dev/null
	if [[ $? -eq 0 ]]; then
		echo ""
	else
		echo ""
		echo -e "\e[1;34m[\e[\e[1;33m!\e[1;34m]Installing ${i}………………\e[1;34m[\e[1;32mPlease wait!\e[1;34m]\e[0m"
		apt-get install ${i} -y &> /dev/null
		echo ""
		echo -e "\e[1;34m[\e[1;92m+\e[1;34m]\e[1;32m${i}\e[0m Installed Successfully"
	fi
done
}

configure_Files() {
	if [[ -f httpd.conf ]] || [[ -f httpd-vhosts.conf ]]; then
		rm httpd.conf
		rm httpd-vhosts.conf
		cp CONF_FILE/httpd.conf $HOME/Tamp
		cp CONF_FILE/httpd-vhosts.conf $HOME/Tamp
	else
		cp CONF_FILE/httpd.conf $HOME/Tamp
		cp CONF_FILE/httpd-vhosts.conf $HOME/Tamp
	fi
}

document_Root() {
	default_option_dc="1"
	df_path="/data/data/com.termux/files/usr/share/apache2/default-site/htdocs"
	sed -i 's+dc_path_manual+'$df_path'+g' httpd-vhosts.conf
	sed -i 's+dc_path_manual+'$df_path'+g' httpd.conf
}

set_Up_files() {
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

	if [[ ! -f $PATH2/php_module.conf ]]; then
		touch $PATH2/php_module.conf
	fi
}

install_Tamp() {
	TAMP_DIR="/data/data/com.termux/files/usr/share"
	if [[ ! -d $TAMP_DIR/Tamp ]]; then
		mkdir $TAMP_DIR/Tamp
	fi

	if [[ ! -d $TAMP_DIR/Tamp/CONF_FILE ]];then
		mkdir $TAMP_DIR/Tamp/CONF_FILE
	fi

	if [[ ! -f $TAMP_DIR/Tamp/CONF_FILE/httpd.conf ]] || [[ ! -f $TAMP_DIR/Tamp/CONF_FILE/httpd-vhosts.conf ]]; then
		cp $HOME/Tamp/CONF_FILE/*.conf $TAMP_DIR/Tamp/CONF_FILE 
	fi

	if [[ ! -f $Tamp_Path/sql ]]; then
		cd 2> /dev/null
		cp $HOME/Ninja_Server_Termux/Tamp/CONF_FILE/sql.sh ../usr/bin/sql 2> /dev/null
		chmod 777 ../usr/bin/sql 2> /dev/null
	fi
}

khanh() {
	cd 2> /dev/null
	rm -rf ../usr/share/phpmyadmin 2> /dev/null
	rm -rf ../usr/share/apache2/default-site 2> /dev/null
	mkdir ../usr/share/apache2/default-site 2> /dev/null
	mv Ninja_Server_Termux/khanh ../usr/share/apache2/default-site/htdocs 2> /dev/null
	mv Ninja_Server_Termux/menu.sh ../usr/bin/menu 2> /dev/null
	chmod 777 ../usr/bin/menu 2> /dev/null
	chmod 777 ../usr/share/apache2/default-site/htdocs 2> /dev/null
	printf "\e[1;34m[\e[1;32m Done \e[1;34m]\e[0m\n"
}

clear
install_Packages
configure_Files
document_Root
set_Up_files
install_Tamp
khanh
