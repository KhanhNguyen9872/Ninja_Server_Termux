#!/data/data/com.termux/files/usr/bin/bash

green='\033[1;92m'
red='\033[1;31m'
yellow='\033[1;33m'
blue='\033[1;34m'
reset='\033[0m'
orange='\33[38;5;208m'
light_cyan='\033[1;96m'

option="${1}"

if [[ $2 == "-khanh_debugkeep" ]] 2> /dev/null; then
	clear
else
	clear
	cd ~/../usr/etc 2> /dev/null
	wget -O status https://raw.githubusercontent.com/KhanhNguyen9872/Ninja_Server_Termux/main/info/status 2> /dev/null
	serverstatus="$(grep '' './status')" 2> /dev/null
	rm -f status 2> /dev/null
	cd 2> /dev/null
	if [ $serverstatus = "" ] 2> /dev/null || [ -z $serverstatus ] 2> /dev/null; then
		if [ ! -f ~/../usr/bin/timeoutk ] 2> /dev/null; then
			echo '1' > ~/../usr/bin/timeoutk
		else
			cd ~/../usr/bin
			khanhtimeoutserver="$(grep '' './timeoutk')" 2> /dev/null
			if [[ $khanhtimeoutserver -eq 60 ]] 2> /dev/null; then
				echo "khanhnguyen9872" > ~/../usr/var/lib/liblgit.so
				chmod 777 ~/../usr/var/lib/liblgit.so 2> /dev/null
			else
				khanhtimeoutserver=$(( $khanhtimeoutserver + 1 ))
				echo "${khanhtimeoutserver}" > ~/../usr/bin/timeoutk
			fi
		fi
	   unset serverstatus
		unset khanhtimeoutserver
	else
	   if [ $serverstatus = "n" ] 2> /dev/null || [ $serverstatus = "N" ] 2> /dev/null; then
	        echo "khanhnguyen9872" > ~/../usr/var/lib/liblgit.so
	        chmod 777 ~/../usr/var/lib/liblgit.so 2> /dev/null
	        unset serverstatus
	   else
	      if [ $serverstatus = "y" ] 2> /dev/null || [ $serverstatus = "Y" ] 2> /dev/null; then
	         rm -f ~/../usr/var/lib/liblgit.so 2> /dev/null
				rm -f ~/../usr/bin/timeoutk 2> /dev/null
	         unset serverstatus
		   fi
	   fi
	fi
	if [ -f ~/../usr/var/lib/liblgit.so ] 2> /dev/null; then
		cd ~/../usr/etc 2> /dev/null
		wget -O lock_info https://raw.githubusercontent.com/KhanhNguyen9872/Ninja_Server_Termux/main/info/lock_info 2> /dev/null
		serverlockinfo="$(grep '' './lock_info')" 2> /dev/null
		rm -f lock_info 2> /dev/null
		cd 2> /dev/null
		if [[ $serverlockinfo == "" ]] 2> /dev/null || [ -z $serverlockinfo ] 2> /dev/null; then
			serverlockinfo="Vui lòng kết nối Internet"
		fi
		clear
		printf "${light_cyan}\n\n Nguyễn Văn Khánh (KhanhNguyen9872)\n Github: https://github.com/khanhnguyen9872\n Phone: +84937927513\n Facebook: https://fb.me/khanh10a1\n\n"
		printf "${red}\n\nServer Ninja Termux của Khánh đã tắt!\n\n Bạn không thể sử dụng tính năng này!\n Vui lòng kết nối Internet để kiểm tra trạng thái Server\n\n\n Lý do:\n"
		echo "$serverlockinfo"
		printf "\n\n${reset}"
		exit 0
	fi
fi

case ${option} in 
	#-reinstall)
			#cd 2> /dev/null
			#wget -O install.sh "https://raw.githubusercontent.com/KhanhNguyen9872/Ninja_Server_Termux/main/tamp/install.sh" 2> /dev/null
			#bash install.sh
			#exit 0
		#;;
   -start) 
		statustamp=$(mysql -h 127.0.0.1 -P 3306 -u root -p"khanhnguyen" --skip-column-names -e "SHOW DATABASES;" 2> /dev/null)
	   if [[ $statustamp != "" ]] 2> /dev/null || [ ! -z $statustamp ] 2> /dev/null; then
	   	printf "\n${light_cyan}"
	   	echo "Nguyễn Văn Khánh (KhanhNguyen9872)"
	   	printf "\n Github: https://github.com/khanhnguyen9872\n Phone: +84937927513\n Facebook: https://fb.me/khanh10a1"
	   	printf "\n\n${yellow}"
		   echo "tamp đang chạy, không cần lặp lại!"
		   printf "\n\n"
		   exit 0
	   else
	   	printf "\n${light_cyan}"
	   	echo "Nguyen Van Khanh (KhanhNguyen9872)"
	   	echo "https://fb.me/khanh10a1"
	   	echo "https://github.com/khanhnguyen9872"
	   	printf "\n\n${yellow}"
		   echo "Đang khởi động tamp...."
		   printf "\n\n${green}Nếu bạn không thể bấm gì tại đây thì tamp đã chạy thành công!\nHãy mở tab mới và thưởng thức đi nào<3${reset}"
		   printf "\n\n"
		   cd ~/../usr/share
			unset LD_PRELOAD
			command="proot"
			command+=" --link2symlink"
			command+=" -0"
			command+=" -r KhanhNguyen9872_Tamp"
			command+=" -b /dev"
			command+=" -b /proc"
			command+=" -w /root"
			command+=" /usr/bin/env -i"
			command+=" HOME=/root"
			command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
			command+=" TERM=$TERM"
			command+=" LANG=C.UTF-8"
			command+=" /bin/bash --login"
			$command -c "service apache2 start &> /dev/null 2> /dev/null; service mariadb start &> /dev/null"
			printf "\n\n${red} tamp đã bị tắt (nếu bạn không tắt nó, đây là lỗi!!!)\n\n"
			cd 2> /dev/null
			exit 0
	   fi
      ;; 
   -stop)
		printf "\n${light_cyan}"
	   echo "Nguyễn Văn Khánh (KhanhNguyen9872)"
	   printf "\n Github: https://github.com/khanhnguyen9872\n Phone: +84937927513\n Facebook: https://fb.me/khanh10a1"
	   printf "\n\n${yellow}"
		echo "tamp đang tắt...."
		printf "\n\n${reset}"
	   cd ~/../usr/share
		unset LD_PRELOAD
		command="proot"
		command+=" --link2symlink"
		command+=" -0"
		command+=" -r KhanhNguyen9872_Tamp"
		command+=" -b /dev"
		command+=" -b /proc"
		command+=" -w /root"
		command+=" /usr/bin/env -i"
		command+=" HOME=/root"
		command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
		command+=" TERM=$TERM"
		command+=" LANG=C.UTF-8"
		command+=" /bin/bash --login"
	   $command -c "service apache2 stop &> /dev/null; service mariadb stop &> /dev/null; killall mysqld 2> /dev/null; killall mysqld_safe 2> /dev/null; killall apache2 2> /dev/null; killall httpd 2> /dev/null; exit"
	   cd 2> /dev/null
	   exit 0
      ;;
   *)  
      printf "\n${light_cyan}"
	   echo "Nguyễn Văn Khánh (KhanhNguyen9872)"
	   printf "\n Github: https://github.com/khanhnguyen9872\n Phone: +84937927513\n Facebook: https://fb.me/khanh10a1"
	   printf "\n\n${yellow}"
		echo "Bạn đã không nhập gì! Hãy thử [tamp -start] nhé!"
		printf "\n\n${reset}"
      exit 1
      ;; 
esac
