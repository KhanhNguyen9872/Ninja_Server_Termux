#!/data/data/com.termux/files/usr/bin/bash -e
cd 2> /dev/null
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'
check_apache2="$(curl -s -X POST http://localhost:8080)"
if [ -z $check_apache2 ]; then
	clear
	printf "${red}\n !!! MySQL is not running !!!\n\n"
	exit 0
fi
keep=1
while [[ $keep -eq 1 ]]; do
	clear
	printf "${green}\nMENU Ninja School\n"
	printf "${red}By KhanhNguyen9872\n"
	printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n${yellow}"
	printf "0. Xem thong tin tai khoan\n1. Dang ky tai khoan\n2. Lock tai khoan\n3. Unlock tai khoan\n4. Lay mat khau hien tai\n5. Doi mat khau\n6. Buff luong\n7. Buff xu\n8. Buff yen\n9. Xoa tai khoan\nK. Thoat (Exit)\n\n${light_cyan}"
	read -p "Lua chon: " khanh
	case ${khanh} in
		0)
			clear
			printf "${green}\nMENU Ninja School\n"
			printf "${red}By KhanhNguyen9872\n\n${yellow}\n"
			printf "${green}\nXem thong tin tai khoan Ninja School\n\n"
			read -p 'Ten tai khoan: ' username
			if [ ! -z $username ] 2> /dev/null; then
				username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
				if [ $username_check = $username ] 2> /dev/null; then
					khanhnguyen9872="$(mysql -u root -D khanh --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
					if [ -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 = "" ] 2> /dev/null; then
						khanhnguyen9872="Chua tao nhan vat Ninja"
						user_gender="Unknown"
						user_level="0"
						user_class="Unknown"
						user_xu="0"
						user_yen="0"
					else
						user_level="$(mysql --user=root -D khanh --skip-column-names -e "SELECT level FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
						user_class="$(mysql --user=root -D khanh --skip-column-names -e "SELECT class FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
						user_gender="$(mysql --user=root -D khanh --skip-column-names -e "SELECT gender FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
						if [[ $user_class = "0" ]] 2> /dev/null; then
							user_class="Chua vao lop"
						else
							if [[ $user_class = "1" ]] 2> /dev/null; then
								user_class="Ninja Kiem [Hirosaki]"
							else
								if [[ $user_class = "2" ]] 2> /dev/null; then
									user_class="Ninja Phi Tieu [Hirosaki]"
								else
									if [[ $user_class = "3" ]] 2> /dev/null; then
										user_class="Ninja Kunai [Ookaza]"
									else
										if [[ $user_class = "4" ]] 2> /dev/null; then
											user_class="Ninja Cung [Ookaza]"
										else
											if [[ $user_class = "5" ]] 2> /dev/null; then
												user_class="Ninja Dao [Haruna]"
											else
												if [[ $user_class = "6" ]] 2> /dev/null; then
													user_class="Ninja Quat [Haruna]"
												else
													user_class="Khong the xac dinh"
												fi
											fi
										fi
									fi
								fi
							fi
						fi
						if [[ $user_gender = "0" ]] 2> /dev/null; then
							user_gender="Nu"
						else
							if [[ $user_gender = "1" ]] 2> /dev/null; then
								user_gender="Nam"
							else
								user_gender="Khong the xac dinh"
							fi
						fi
						user_xu="$(mysql --user=root -D khanh --skip-column-names -e "SELECT xu FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
						user_xuBox="$(mysql --user=root -D khanh --skip-column-names -e "SELECT xuBox FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
						user_yen="$(mysql --user=root -D khanh --skip-column-names -e "SELECT yen FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
					fi
					user_luong="$(mysql --user=root -D khanh --skip-column-names -e "SELECT luong FROM player WHERE username='$username'")" 2> /dev/null
					user_trangthai="$(mysql --user=root -D khanh --skip-column-names -e "SELECT ban FROM player WHERE username='$username'")" 2> /dev/null
					if [[ $user_trangthai -eq 0 ]]; then
						user_trangthai="Dang kich hoat [Unlocked]"
					else
						if [[ $user_trangthai -eq 1 ]]; then
							user_trangthai="Dang bi khoa [Locked]"
						else
							user_trangthai="Khong the xac dinh"
						fi
					fi
					clear
					printf "${green}\nMENU Ninja School\n"
					printf "${red}By KhanhNguyen9872\n\n${yellow}\n"
					printf "${green}\nXem thong tin tai khoan Ninja School\n\n\n"
					printf "${yellow} Ten tai khoan: $username\n"
					printf " Ten Ninja: $khanhnguyen9872\n"
					printf " Gioi tinh: $user_gender\n"
					printf " Level: $user_level\n"
					printf " Lop: $user_class\n"
					printf " Xu: $user_xu\n"
					printf " Xu giu ruong: $user_xuBox\n"
					printf " Yen: $user_yen\n"
					printf " Luong: $user_luong\n"
					printf " Trang thai: $user_trangthai\n\n\n"
					read -p 'Press Enter to exit!' pause
				else
					printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
					read -p 'Press Enter to exit!' pause
				fi
			fi
		;;
		4)
			clear
			printf "${green}\nMENU Ninja School\n"
			printf "${red}By KhanhNguyen9872\n\n${yellow}\n"
			printf "${green}\nLay mat khau hien tai Ninja School\n\n"
			read -p 'Ten tai khoan: ' username
			username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
			if [ $username_check = $username ] 2> /dev/null; then
				matkhau_khanh="$(mysql --user=root -D khanh --skip-column-names -e "SELECT password FROM player WHERE username='$username';")" 2> /dev/null
				printf "${yellow}\n Mat khau hien tai: "
                                echo "$matkhau_khanh"
                                printf "\n\n${reset}"
				read -p 'Press Enter to exit!' pause
			else
				printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
				read -p 'Press Enter to exit!' pause
			fi
		;;
		5)
			clear
			printf "${green}\nMENU Ninja School\n"
			printf "${red}By KhanhNguyen9872\n\n${yellow}\n"
			printf "${green}\nDoi mat khau Ninja School\n\n"
			read -p 'Ten tai khoan: ' username
			read -p 'Mat khau hien tai: ' password
			read -p 'Mat khau moi: ' passwordnew
			read -p 'Nhap lai mat khau moi: ' repassword
			if [ -z $username ] 2> /dev/null || [ -z $password ] 2> /dev/null || [ -z $repassword ] 2> /dev/null || [ -z $passwordnew ] 2> /dev/null; then
				printf "${red}\n !!! Thong tin khong hop le !!!\n\n${reset}"
				read -p 'Press Enter to exit!' pause
			else
				username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
				if [ $username_check = $username ] 2> /dev/null && [ ! -z $username_check ] 2> /dev/null; then
					if [ $passwordnew = $repassword ] 2> /dev/null; then
						matkhau_khanh="$(mysql --user=root -D khanh --skip-column-names -e "SELECT password FROM player WHERE username='$username';")" 2> /dev/null
						if [ $matkhau_khanh = $password ] 2> /dev/null; then
							mysql --user=root -D khanh -e "UPDATE player SET password='$passwordnew' WHERE username='$username';"
							printf "\n${yellow} Doi mat khau thanh cong!\n\n${reset}"
							read -p 'Press Enter to exit!' pause
						else
							printf "\n${red} !!! Mat khau hien tai khong dung !!!\n\n${reset}"
							read -p 'Press Enter to exit!' pause
						fi
					else
						printf "\n${red} !!! Mat khau moi khong trung khop voi nhau !!!\n\n${reset}"
						read -p 'Press Enter to exit!' pause
					fi
				else
					printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
					read -p 'Press Enter to exit!' pause
				fi
			fi
		;;
		1)
			clear
			printf "${green}\nMENU Ninja School\n"
			printf "${red}By KhanhNguyen9872\n\n${yellow}\n"
			printf "${green}\nDang ky tai khoan Ninja School\n\n"
			read -p 'Ten tai khoan: ' username
			read -p 'Mat khau: ' password
			read -p 'Nhap lai mat khau: ' repassword
			if [ -z $username ] 2> /dev/null || [ -z $password ] 2> /dev/null || [ -z $repassword ] 2> /dev/null; then
				printf "${red}\n !!! Thong tin dang ky khong hop le !!!\n\n${reset}"
				read -p 'Press Enter to exit!' pause
			else
				if [[ $password -eq $repassword ]] 2> /dev/null || [ $password = $repassword ] 2> /dev/null; then
					username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
					if [ $username_check = $username ] 2> /dev/null; then
						printf "${red}\n !!! Tai khoan nay da ton tai !!!\n\n${reset}"
						read -p 'Press Enter to exit!' pause
					else
						mysql --user=root -D khanh << EOF
INSERT INTO player (\`username\`, \`password\`, \`lock\`) VALUES ("${username}", "${password}", '0');
EOF
						printf "\n${yellow} Dang ky thanh cong!\n\n${reset}"
						read -p 'Press Enter to exit!' pause
					fi
				else
					printf "${red}\n !!! Mat khau khong trung nhau !!!\n\n${reset}"
					read -p 'Press Enter to exit!' pause
				fi
			fi
		;;
		2)
			clear
			printf "${green}\nMENU Ninja School\n"
			printf "${red}By KhanhNguyen9872\n\n${yellow}\n"
			printf "${green}\nLock tai khoan Ninja School\n\n"
			read -p 'Ten tai khoan: ' username
			printf "${red}\n"
			read -p 'Ban co muon khoa tai khoan nay khong? [Y/N]: ' yesorno
			printf "${reset}"
			if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
				username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
				if [ $username_check = $username ] 2> /dev/null; then
					mysql --user=root -D khanh -e "UPDATE player SET ban = replace(ban,'0','1') WHERE username='$username';"
					printf "\n${yellow} Khoa tai khoan $username thanh cong!\n\n${reset}"
					read -p 'Press Enter to exit!' pause
				else
					printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
					read -p 'Press Enter to exit!' pause
				fi
			fi
		;;
		6)
			clear
			printf "${green}\nMENU Ninja School\n"
			printf "${red}By KhanhNguyen9872\n\n${yellow}\n"
			printf "${green}\nBuff Luong Ninja School\n\n"
			printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
			read -p 'Ten tai khoan: ' username
			read -p 'Nhap so Luong: ' luong
			printf "${red}\n"
			read -p 'Ban co muon buff luong khong? [Y/N]: ' yesorno
			printf "${reset}"
			if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
				if [[ $luong -gt 2000000000 ]]; then
					printf "\n${red} !!! Luong vuot qua muc cho phep (Toi da: 2.000.000.000) !!!\n\n${reset}"
					read -p 'Press Enter to exit!' pause
				else
					username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
					if [ $username_check = $username ] 2> /dev/null; then
						mysql --user=root -D khanh -e "UPDATE player SET luong = '$luong' WHERE username='$username';"
						printf "\n${yellow} Buff ${luong} Luong thanh cong!\n\n${reset}"
						read -p 'Press Enter to exit!' pause
					else
						printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
						read -p 'Press Enter to exit!' pause
					fi
				fi
			fi
		;;
		7)
			clear
			printf "${green}\nMENU Ninja School\n"
			printf "${red}By KhanhNguyen9872\n\n${yellow}\n"
			printf "${green}\nBuff Xu Ninja School\n\n"
			printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
			read -p 'Ten tai khoan: ' username
			read -p 'Nhap so Xu: ' xu
			printf "${red}\n"
			read -p 'Ban co muon buff xu khong? [Y/N]: ' yesorno
			printf "${reset}"
			if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
				if [[ $xu -gt 2000000000 ]]; then
					printf "\n${red} !!! Xu vuot qua muc cho phep (Toi da: 2.000.000.000) !!!\n\n${reset}"
					read -p 'Press Enter to exit!' pause
				else
					username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
					if [ $username_check = $username ] 2> /dev/null; then
						khanhnguyen9872="$(mysql -u root -D khanh --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
						if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
							mysql --user=root -D khanh -e "UPDATE ninja SET xu = '$xu' WHERE name='$khanhnguyen9872';"
							printf "\n${yellow} Buff ${xu} Xu thanh cong!\n\n${reset}"
							read -p 'Press Enter to exit!' pause
						else
							printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
							read -p 'Press Enter to exit!' 
						fi					
					else
						printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
						read -p 'Press Enter to exit!' pause
					fi
				fi
			fi
		;;
		8)
			clear
			printf "${green}\nMENU Ninja School\n"
			printf "${red}By KhanhNguyen9872\n\n${yellow}\n"
			printf "${green}\nBuff Yen Ninja School\n\n"
			printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
			read -p 'Ten tai khoan: ' username
			read -p 'Nhap so Yen: ' yen
			printf "${red}\n"
			read -p 'Ban co muon buff Yen khong? [Y/N]: ' yesorno
			printf "${reset}"
			if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
				if [[ $yen -gt 2000000000 ]]; then
					printf "\n${red} !!! Yen vuot qua muc cho phep (Toi da: 2.000.000.000) !!!\n\n${reset}"
					read -p 'Press Enter to exit!' pause
				else
					username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
					if [ $username_check = $username ] 2> /dev/null; then
						khanhnguyen9872="$(mysql -u root -D khanh --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
						if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
							mysql --user=root -D khanh -e "UPDATE ninja SET yen = '$yen' WHERE name='$khanhnguyen9872';"
							printf "\n${yellow} Buff ${yen} Yen thanh cong!\n\n${reset}"
							read -p 'Press Enter to exit!' pause
						else
							printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
							read -p 'Press Enter to exit!' 
						fi					
					else
						printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
						read -p 'Press Enter to exit!' pause
					fi
				fi
			fi
		;;
		3)
			clear
			printf "${green}\nMENU Ninja School\n"
			printf "${red}By KhanhNguyen9872\n\n${yellow}\n"
			printf "${green}\nUnlock tai khoan Ninja School\n\n"
			read -p 'Ten tai khoan: ' username
			printf "${red}\n"
			read -p 'Ban co muon mo khoa tai khoan nay khong? [Y/N]: ' yesorno
			printf "${reset}"
			if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
				username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
				if [ $username_check = $username ] 2> /dev/null; then
					mysql --user=root -D khanh -e "UPDATE player SET ban = replace(ban,'1','0') WHERE username='$username';"
					printf "\n${yellow} Mo khoa tai khoan $username thanh cong!\n\n${reset}"
					read -p 'Press Enter to exit!' pause
				else
					printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
					read -p 'Press Enter to exit!' pause
				fi
			fi
		;;
		9)
			clear
			printf "${green}\nMENU Ninja School\n"
			printf "${red}By KhanhNguyen9872\n\n${yellow}\n"
			printf "${red}\nXoa tai khoan Ninja School\n\n${green}"
			read -p 'Ten tai khoan: ' username
			printf "${red}\n"
			read -p 'Ban co muon xoa tai khoan nay khong? [Y/N]: ' yesorno
			if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
				echo ""
				read -p 'Ban co chac chan xoa tai khoan nay hay khong? [Y/N]: ' yesornolast
				printf "${reset}"
				if [ $yesornolast = "y" ] 2> /dev/null || [ $yesornolast = "Y" ] 2> /dev/null; then
					username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
					if [ $username_check = $username ] 2> /dev/null; then
						khanhnguyen9872="$(mysql -u root -D khanh --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
						mysql --user=root -D khanh --skip-column-names -e "DELETE FROM player WHERE username='$username';"
						mysql --user=root -D khanh --skip-column-names -e "DELETE FROM ninja WHERE name='$khanhnguyen9872';"
						mysql --user=root -D khanh -e "UPDATE player SET ban = replace(ban,'1','0') WHERE username='$username';"
						printf "\n${yellow} Xoa tai khoan $username thanh cong!\n\n${reset}"
						read -p 'Press Enter to exit!' pause
					else
						printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
						read -p 'Press Enter to exit!' pause
					fi
				fi
			fi
		;;
		*)
			if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
				clear
				printf "\n${green} - Good bye!${reset}\n\n"
				exit 0
			fi
		;;
	esac
	unset check_apache2
	unset khanh
	unset pause
	unset user_gender
	unset user_class
	unset user_trangthai
	unset user_xu
	unset user_xuBox
	unset user_yen
	unset user_luong
	unset user_level
	unset khanhnguyen9872
	unset xu
	unset yesorno
	unset username_check
	unset username
	unset luong
	unset yen
	unset repassword
	unset password
done
