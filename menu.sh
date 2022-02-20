#!/data/data/com.termux/files/usr/bin/bash -e
# KhanhNguyen9872
# Github: https://github.com/khanhnguyen9872
# FB: https://fb.me/khanh10a1
## All code here by KhanhNguyen9872
## Please don't re-upload without my name!
cd 2> /dev/null
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'
check_apache2="$(curl -s -X POST http://localhost:8080)"
if [ -z $check_apache2 ] 2> /dev/null || ! ps -C httpd >/dev/null; then
	printf "${red}\n\n !!! MySQL is not running !!!\n\n\n"
	exit 0
fi
keep=1
while [[ $keep -eq 1 ]]; do
	if [ -f ~/../usr/etc/HOIUC ] 2> /dev/null; then
		clear
		printf "${green}\nMENU Ninja School\n"
		printf "${red}By KhanhNguyen9872\n\n"
		printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
		printf "${blue} Current: HOIUC-2022\n\n${yellow}"
		printf "0. Xem thong tin tai khoan\n1. Dang ky tai khoan\n2. Lock/Unlock tai khoan\n3. Mat khau [Doi pass, Lay pass,...]\n4. Buff [Luong, Yen, Xu, Level,...]\n5. Reset [Tiem nang]\n6. Backup/Restore your data\n7. More...\n8. Settings\n9. Xoa tai khoan\nK. Thoat (Exit)\n\n${light_cyan}"
		read -p "Lua chon: " khanh
		case ${khanh} in
			8)
				keep_on=1
				while [[ $keep_on -eq 1 ]] 2> /dev/null; do
					if [ -f ~/../usr/etc/HOIUC ] 2> /dev/null; then
						source="HOIUC-2022"
					else
						if [ -f ~/../usr/etc/FullNV ] 2> /dev/null; then
							source="FullNhiemVu-2022"
						else
							source="Unknown"
						fi
					fi
					clear
					printf "${green}\nMENU Ninja School\n"
					printf "${red}By KhanhNguyen9872\n\n"
					printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n"
					printf "${green}\nSettings\n\n"
					printf "${yellow}\n 1. Change Source [Current: $source]\n K. Thoat ra menu\n\n${light_cyan}"
					read -p "Lua chon: " khanhsource
					case ${khanhsource} in
						1)
							if [ $source = "HOIUC-2022" ] 2> /dev/null; then
								rm -f ~/../usr/etc/HOIUC 2> /dev/null
								echo 'KhanhNguyen9872' > ~/../usr/etc/FullNV
							else
								if [ $source = "FullNhiemVu-2022" ] 2> /dev/null; then
									rm -f ~/../usr/etc/FullNV 2> /dev/null
									echo 'KhanhNguyen9872' > ~/../usr/etc/HOIUC
								fi
							fi
						;;
						*)
							if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
								keep_on=0
							fi
						;;
					esac
				done
			;;
			6)
				keep_on=1
				while [[ $keep_on -eq 1 ]] 2> /dev/null; do
					clear
					printf "${green}\nMENU Ninja School\n"
					printf "${red}By KhanhNguyen9872\n\n"
					printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n"
					printf "${yellow}\n1. Backup your data\n2. Restore your data\nK. Thoat ra menu\n\n${light_cyan}"
					read -p "Lua chon: " khanh
					case ${khanh} in
						1)
							clear
							printf "${green}\nMENU Ninja School\n"
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
							printf "${yellow} Backup your data\n"
							printf " File: /sdcard/khanh_nja.backup [Internal Storage]\n\n${light_cyan}"
							read -p "Do you want to backup it? [Y/N] " yesorno
							printf "\n"
							if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
								check_apache2="$(curl -s -X POST http://localhost:8080)"
								if [ -z $check_apache2 ] || ! ps -C httpd >/dev/null; then
									clear
									printf "${red}\n\n !!! MySQL is not running !!!\n\nExiting...\n\n"
									exit 0
								else
									if [ -f /sdcard/khanh_nja.backup ] 2> /dev/null; then
										rm -f /sdcard/khanh_nja.backup 2> /dev/null
									fi
									mysqldump -u root --databases khanh >> /sdcard/khanh_nja.backup
									if [ -f /sdcard/khanh_nja.backup ] 2> /dev/null; then
										printf "${light_cyan}\n\n Backup completed!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										printf "${red}\n\n Backup failed!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									fi
								fi
							fi
						;;
						2)
							clear
							printf "${green}\nMENU Ninja School\n"
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
							printf "${yellow} Restore your data\n\n Example:\n"
							printf " /sdcard/khanh_nja.backup\n\n${light_cyan}"
							read -p "File Restore in: " restorefile
							printf "\n${green}"
							read -p "Do you want to restore it? [Y/N] " yesorno
							if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
								printf "${red}\n\n WARNING: ALL DATA CURRENT WILL BE DESTROYED!\n"
								read -p "Ban co chac chan muon tiep tuc? [Y/N] " yesorno1
								if [ $yesorno1 = "y" ] 2> /dev/null || [ $yesorno1 = "Y" ] 2> /dev/null; then
									if [ $restorefile = "" ] 2> /dev/null || [ -z $restorefile ] 2> /dev/null; then
										printf "\n${red} Ban da nhap sai duong dan file!\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										if [ -f $restorefile ] 2> /dev/null; then
											check_apache2="$(curl -s -X POST http://localhost:8080)"
											if [ -z $check_apache2 ] || ! ps -C httpd >/dev/null; then
												clear
												printf "${red}\n\n !!! MySQL is not running !!!\n\nExiting...\n\n"
												exit 0
											else
												mysql -u root -e "DROP DATABASE IF EXISTS khanh; CREATE DATABASE khanh;"
												mysql -u root khanh < $restorefile
												printf "\n${light_cyan} Restore completed!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											fi
										else
											printf "\n${red} File Restore khong ton tai! [NOT FOUND]\n${reset}"
											read -p 'Press Enter to exit!' pause
										fi
									fi
								fi
							fi
						;;
						*)
							if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
								keep_on=0
							fi
						;;
					esac
				done

			;;
			0)
				clear
				printf "${green}\nMENU Ninja School\n"
				printf "${red}By KhanhNguyen9872\n\n"
				printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n"
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
							user_xuBox="0"
							user_yen="0"
							user_classpt="Unknown"
							user_speed="0"
							user_speedpt="0"
							user_levelpt="0"
						else
							user_speed="$(mysql --user=root -D khanh --skip-column-names -e "SELECT speed FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
							user_speedpt="$(mysql --user=root -D khanh --skip-column-names -e "SELECT speed FROM clone_ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
							user_level="$(mysql --user=root -D khanh --skip-column-names -e "SELECT level FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
							user_class="$(mysql --user=root -D khanh --skip-column-names -e "SELECT class FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
							user_levelpt="$(mysql --user=root -D khanh --skip-column-names -e "SELECT level FROM clone_ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
							user_classpt="$(mysql --user=root -D khanh --skip-column-names -e "SELECT class FROM clone_ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
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
							if [[ $user_classpt = "0" ]] 2> /dev/null; then
								user_classpt="Chua vao lop"
							else
								if [[ $user_class = "1" ]] 2> /dev/null; then
									user_classpt="Ninja Kiem [Hirosaki]"
								else
									if [[ $user_class = "2" ]] 2> /dev/null; then
										user_classpt="Ninja Phi Tieu [Hirosaki]"
									else
										if [[ $user_class = "3" ]] 2> /dev/null; then
											user_classpt="Ninja Kunai [Ookaza]"
										else
											if [[ $user_class = "4" ]] 2> /dev/null; then
												user_classpt="Ninja Cung [Ookaza]"
											else
												if [[ $user_class = "5" ]] 2> /dev/null; then
													user_classpt="Ninja Dao [Haruna]"
												else
													if [[ $user_class = "6" ]] 2> /dev/null; then
														user_classpt="Ninja Quat [Haruna]"
													else
														user_classpt="Khong the xac dinh"
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
							user_nv="$(mysql --user=root -D khanh --skip-column-names -e "SELECT taskId FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
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
						printf "${red}By KhanhNguyen9872\n\n"
						printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
						printf "${green}\nXem thong tin tai khoan Ninja School\n\n\n"
						printf "${yellow} Ten tai khoan: $username\n"
						printf " Ten Ninja: $khanhnguyen9872\n"
						printf " Gioi tinh: $user_gender\n"
						printf " Level: $user_level\n"
						printf " Lop: $user_class\n"
						printf " ID Nhiem vu: $user_nv\n"
						printf " Toc chay: $user_speed\n"
						printf " Xu: $user_xu\n"
						printf " Xu giu ruong: $user_xuBox\n"
						printf " Yen: $user_yen\n"
						printf " Luong: $user_luong\n"
						printf " Level [Phan Than]: $user_levelpt\n"
						printf " Lop [Phan Than]: $user_classpt\n"
						printf " Toc chay [Phan Than]: $user_speedpt\n"
						printf " Trang thai: $user_trangthai\n\n\n"
						read -p 'Press Enter to exit!' pause
					else
						printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
						read -p 'Press Enter to exit!' pause
					fi
				fi
			;;
			3)
				keep_on=1
				while [[ $keep_on -eq 1 ]]; do
					clear
					printf "${green}\nMENU Ninja School\n"
					printf "${red}By KhanhNguyen9872\n\n"
					printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n${yellow}"
					printf "1. Lay mat khau hien tai\n2. Doi mat khau\nK. Thoat ra menu\n\n${light_cyan}"
					read -p 'Lua chon: ' khanh
					case ${khanh} in
						1)
							clear
							printf "${green}\nMENU Ninja School\n"
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n"
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
						2)
							clear
							printf "${green}\nMENU Ninja School\n"
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n"
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
						*)
							if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
								keep_on=0
							fi
						;;
					esac
				done
			;;
			1)
				clear
				printf "${green}\nMENU Ninja School\n"
				printf "${red}By KhanhNguyen9872\n\n"
				printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n"
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
				keep_on=1
				while [[ $keep_on -eq 1 ]] 2> /dev/null; do
					clear
					printf "${green}\nMENU Ninja School\n"
					printf "${red}By KhanhNguyen9872\n\n${yellow}"
					printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n${yellow}"
					printf "1. Lock tai khoan\n2. Unlock tai khoan\nK. Thoat ra menu\n\n${light_cyan}"
					read -p 'Lua chon: ' khanh
					case ${khanh} in
						1)
							clear
							printf "${green}\nMENU Ninja School\n"
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
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
						2)
							clear
							printf "${green}\nMENU Ninja School\n"
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
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
						*)
							if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
								keep_on=0
							fi
						;;
					esac
				done
			;;
			4)
				keep_on=1
				while [[ $keep_on -eq 1 ]]; do
					clear
					printf "${green}\nMENU Ninja School\n"
					printf "${red}By KhanhNguyen9872\n\n"
					printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
					printf "${yellow}0. Nhiem vu\n1. Buff Luong\n2. Buff Xu\n3. Buff Yen\n4. Buff Level\n5. Buff Level Phan than\n6. Buff Toc chay\n7. Buff Tiem nang\n8. Buff Ky nang\n9. Buff Level Tu tien [Thu nghiem]\nK. Thoat ra menu\n\n${light_cyan}"
					read -p 'Lua chon: ' khanh
					case ${khanh} in
						0)
						keep_on1=1
						while [[ $keep_on1 -eq 1 ]] 2> /dev/null; do
							clear
							printf "${green}\nMENU Ninja School\n"
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
							printf "${yellow}1. Skip nhiem vu hien tai\n2. Quay ve nhiem vu truoc\nK. Thoat ra menu\n\n${light_cyan}"
							read -p 'Lua chon: ' khanh
							case ${khanh} in
								1)
									clear
									printf "${green}\nMENU Ninja School\n"
									printf "${red}By KhanhNguyen9872\n\n"
									printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
									printf "${green}\nSkip Nhiem vu hien tai Ninja School\n\n"
									printf "${red} Tinh nang khong kha dung [HOIUC-2022]\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								;;
								2)
									clear
									printf "${green}\nMENU Ninja School\n"
									printf "${red}By KhanhNguyen9872\n\n"
									printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
									printf "${green}\Quay ve nhiem vu truoc Ninja School\n\n"
									printf "${red} Tinh nang khong kha dung [HOIUC-2022]\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								;;
								*)
									if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
										keep_on1=0
									fi
								;;
							esac
						done
						;;
						1)
							clear
							printf "${green}\nMENU Ninja School\n"
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
							printf "${green}\nBuff Luong Ninja School\n\n"
							printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
							read -p 'Ten tai khoan: ' username
							read -p 'Nhap so Luong: ' luong
							printf "${red}\n"
							read -p 'Ban co muon buff luong khong? [Y/N]: ' yesorno
							printf "${reset}"
							if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
								if [[ $luong -gt 2000000000 ]] 2> /dev/null || [[ $luong -lt 0 ]] 2> /dev/null; then
									printf "\n${red} !!! So Luong khong hop le (0 - 2.000.000.000) !!!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								else
									username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
									if [ $username_check = $username ] 2> /dev/null; then
										mysql --user=root -D khanh -e "UPDATE player SET luong = '$luong' WHERE username='$username';"
										printf "\n${yellow} Buff ${luong} Luong cho [${username}] thanh cong!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									fi
								fi
							fi
						;;
						2)
							clear
							printf "${green}\nMENU Ninja School\n"
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
							printf "${green}\nBuff Xu Ninja School\n\n"
							printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
							read -p 'Ten tai khoan: ' username
							read -p 'Nhap so Xu: ' xu
							printf "${red}\n"
							read -p 'Ban co muon buff xu khong? [Y/N]: ' yesorno
							printf "${reset}"
							if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
								if [[ $xu -gt 2000000000 ]] 2> /dev/null || [[ $xu -lt 0 ]] 2> /dev/null; then
									printf "\n${red} !!! So Xu khong hop le (0 - 2.000.000.000) !!!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								else
									username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
									if [ $username_check = $username ] 2> /dev/null; then
										khanhnguyen9872="$(mysql -u root -D khanh --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
										if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
										mysql --user=root -D khanh -e "UPDATE ninja SET xu = '$xu' WHERE name='$khanhnguyen9872';"
											printf "\n${yellow} Buff ${xu} Xu cho [${username}] thanh cong!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										else
											printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
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
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
							printf "${green}\nBuff Yen Ninja School\n\n"
							printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
							read -p 'Ten tai khoan: ' username
							read -p 'Nhap so Yen: ' yen
							printf "${red}\n"
							read -p 'Ban co muon buff Yen khong? [Y/N]: ' yesorno
							printf "${reset}"
							if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
								if [[ $yen -gt 2000000000 ]] 2> /dev/null || [[ $yen -lt 0 ]] 2> /dev/null; then
									printf "\n${red} !!! So Yen khong hop le (0 - 2.000.000.000) !!!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								else
									username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
									if [ $username_check = $username ] 2> /dev/null; then
										khanhnguyen9872="$(mysql -u root -D khanh --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
										if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
											mysql --user=root -D khanh -e "UPDATE ninja SET yen = '$yen' WHERE name='$khanhnguyen9872';"
											printf "\n${yellow} Buff ${yen} Yen cho [${username}] thanh cong!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										else
											printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										fi					
									else
										printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									fi
								fi
							fi
						;;
						4)
							clear
							printf "${green}\nMENU Ninja School\n"
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
							printf "${green}\nBuff Level Ninja School\n\n"
							printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
							read -p 'Ten tai khoan: ' username
							read -p 'Nhap Level: ' level
							printf "${red}\n"
							read -p 'Ban co muon buff Level khong? [Y/N]: ' yesorno
							printf "${reset}"
							if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
								if [[ $level -gt 130 ]] 2> /dev/null || [[ $level -lt 1 ]] 2> /dev/null; then
									printf "\n${red} !!! Level khong hop le (1 - 130) !!!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								else
									username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
									if [ $username_check = $username ] 2> /dev/null; then
										khanhnguyen9872="$(mysql -u root -D khanh --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
										if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
											printf "\nPlease wait....\n"
											khanhnguyen9872_1=0
											for i in $(seq 1 $level); do khanhnguyen9872_2="$(mysql -u root -D khanh --skip-column-names -e "SELECT exps FROM level WHERE level='$i';" | awk -F \| '{ printf $1 }')"; khanhnguyen9872_1=$(( $khanhnguyen9872_1 + $khanhnguyen9872_2 )); done
											if [[ $level -eq 130 ]] 2> /dev/null; then
												khanhnguyen9872_1=$(( $khanhnguyen9872_1 - 500000000 ))
											fi
											mysql --user=root -D khanh -e "UPDATE ninja SET level = '$level' WHERE name='$khanhnguyen9872';"
											mysql --user=root -D khanh -e "UPDATE ninja SET exp = '$khanhnguyen9872_1' WHERE name='$khanhnguyen9872';"
											printf "\n${yellow} Buff Level ${level} cho [${username}] thanh cong!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										else
											printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										fi					
									else
										printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									fi
								fi
							fi
						;;
						5)
							clear
							printf "${green}\nMENU Ninja School\n"
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
							printf "${green}\nBuff Level Phan Than Ninja School\n\n"
							printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
							read -p 'Ten tai khoan: ' username
							read -p 'Nhap Level: ' level
							printf "${red}\n"
							read -p 'Ban co muon buff Level Phan Than khong? [Y/N]: ' yesorno
							printf "${reset}"
							if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
								if [[ $level -gt 130 ]] 2> /dev/null || [[ $level -lt 1 ]] 2> /dev/null; then
									printf "\n${red} !!! Level khong hop le (1 - 130) !!!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								else
									username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
									if [ $username_check = $username ] 2> /dev/null; then
										khanhnguyen9872="$(mysql -u root -D khanh --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
										if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
											khanhnguyen9872_0="$(mysql -u root -D khanh --skip-column-names -e "SELECT level FROM ninja WHERE name='$khanhnguyen9872';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
											if [[ $khanhnguyen9872_0 -lt 90 ]] 2> /dev/null; then
												printf "\n${red} !!! Ninja ${khanhnguyen9872} chua du level 90 tro len !!!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											else
												printf "\nPlease wait....\n"
												khanhnguyen9872_1=0
												for i in $(seq 1 $level); do khanhnguyen9872_2="$(mysql -u root -D khanh --skip-column-names -e "SELECT exps FROM level WHERE level='$i';" | awk -F \| '{ printf $1 }')"; khanhnguyen9872_1=$(( $khanhnguyen9872_1 + $khanhnguyen9872_2 )); done
												if [[ $level -eq 130 ]] 2> /dev/null; then
													khanhnguyen9872_1=$(( $khanhnguyen9872_1 - 500000000 ))
												fi
												mysql --user=root -D khanh -e "UPDATE clone_ninja SET level = '$level' WHERE name='$khanhnguyen9872';"
												mysql --user=root -D khanh -e "UPDATE clone_ninja SET exp = '$khanhnguyen9872_1' WHERE name='$khanhnguyen9872';"
												printf "\n${yellow} Buff Level ${level} cho [${username}] thanh cong!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											fi
										else
											printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										fi					
									else
										printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									fi
								fi
							fi
						;;
						6)
							clear
							printf "${green}\nMENU Ninja School\n"
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
							printf "${green}\nBuff Toc chay Ninja School\n\n"
							printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
							read -p 'Ten tai khoan: ' username
							read -p 'Nhap so toc chay: ' tocchay
							printf "${red}\n"
							read -p 'Ban co muon buff Level khong? [Y/N]: ' yesorno
							printf "${reset}"
							if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
								if [[ $tocchay -gt 12 ]] 2> /dev/null || [[ $tocchay -lt 1 ]] 2> /dev/null; then
									printf "\n${red} !!! Toc chay khong hop le (1 - 12) !!!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								else
									username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
									if [ $username_check = $username ] 2> /dev/null; then
										khanhnguyen9872="$(mysql -u root -D khanh --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
										if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
											mysql --user=root -D khanh -e "UPDATE ninja SET speed = '$tocchay' WHERE name='$khanhnguyen9872';"
											printf "\n${yellow} Buff Toc chay ${tocchay} cho [${username}] thanh cong!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										else
											printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										fi					
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
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
							printf "${green}\nBuff Tiem nang Ninja School\n\n"
							printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
							read -p 'Ten tai khoan: ' username
							read -p 'Nhap so Tiem nang: ' tiemnang
							printf "${red}\n"
							read -p 'Ban co muon buff Tiem nang khong? [Y/N]: ' yesorno
							printf "${reset}"
							if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
								if [[ $tiemnang -gt 32500 ]] 2> /dev/null || [[ $tiemnang -lt 100 ]] 2> /dev/null; then
									printf "\n${red} !!! Tiem nang khong hop le (100 - 32.500) !!!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								else
									username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
									if [ $username_check = $username ] 2> /dev/null; then
										khanhnguyen9872="$(mysql -u root -D khanh --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
										if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
											mysql --user=root -D khanh -e "UPDATE ninja SET ppoint = '$tiemnang' WHERE name='$khanhnguyen9872';"
											printf "\n${yellow} Buff Tiem nang ${tiemnang} cho [${username}] thanh cong!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										else
											printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
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
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
							printf "${green}\nBuff Ky nang Ninja School\n\n"
							printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
							read -p 'Ten tai khoan: ' username
							read -p 'Nhap so Ky nang: ' kynang
							printf "${red}\n"
							read -p 'Ban co muon buff Ky nang khong? [Y/N]: ' yesorno
							printf "${reset}"
							if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
								if [[ $kynang -gt 150 ]] 2> /dev/null || [[ $kynang -lt 1 ]] 2> /dev/null; then
									printf "\n${red} !!! Ky nang khong hop le (1 - 150) !!!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								else
									username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
									if [ $username_check = $username ] 2> /dev/null; then
										khanhnguyen9872="$(mysql -u root -D khanh --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
										if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
											mysql --user=root -D khanh -e "UPDATE ninja SET spoint = '$kynang' WHERE name='$khanhnguyen9872';"
											printf "\n${yellow} Buff Ky nang ${kynang} cho [${username}] thanh cong!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										else
											printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										fi					
									else
										printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									fi
								fi
							fi
						;;
						*)
							if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
								keep_on=0
							fi
						;;
					esac
				done
			;;
			5)
				clear
				printf "${green}\nMENU Ninja School\n"
				printf "${red}By KhanhNguyen9872\n\n"
				printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
				printf "${green}\nReset Tiem nang Ninja School\n\n"
				printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
				read -p 'Ten tai khoan: ' username
				printf "${red}\n"
				read -p 'Ban co muon reset Tiem nang khong? [Y/N]: ' yesorno
				if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
					read -p 'Toan bo Tiem nang se reset! Ban chac chan khong? [Y/N]: ' yesorno1
					printf "${reset}"
					if [ $yesorno1 = "y" ] 2> /dev/null || [ $yesorno1 = "Y" ] 2> /dev/null; then
						username_check="$(mysql --user=root -D khanh --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
						if [ $username_check = $username ] 2> /dev/null; then
							khanhnguyen9872="$(mysql -u root -D khanh --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
							if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
								mysql --user=root -D khanh -e "UPDATE ninja SET ppoint = '100' WHERE name='$khanhnguyen9872';"
								mysql --user=root -D khanh -e "UPDATE ninja SET potential1 = '15' WHERE name='$khanhnguyen9872';"
								mysql --user=root -D khanh -e "UPDATE ninja SET potential2 = '5' WHERE name='$khanhnguyen9872';"
								mysql --user=root -D khanh -e "UPDATE ninja SET potential3 = '5' WHERE name='$khanhnguyen9872';"
								mysql --user=root -D khanh -e "UPDATE ninja SET potential4 = '5' WHERE name='$khanhnguyen9872';"
								printf "\n${yellow} Reset Tiem nang cho [${username}] thanh cong!\n\n${reset}"
								read -p 'Press Enter to exit!' pause
							else
								printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
								read -p 'Press Enter to exit!' pause
							fi					
						else
							printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
							read -p 'Press Enter to exit!' pause
						fi
					fi
				fi
			;;
			9)
				clear
				printf "${green}\nMENU Ninja School\n"
				printf "${red}By KhanhNguyen9872\n\n"
				printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
				printf "${red}\nXoa tai khoan Ninja School\n\n${green}"
				read -p 'Ten tai khoan: ' username
				printf "${red}\n"
				read -p 'Ban co muon xoa tai khoan nay khong? [Y/N]: ' yesorno
				if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
					echo ""
					read -p 'Ban co chac chan xoa tai khoan nay hay khong? [Y/N]: ' yesornolast
					if [ $yesornolast = "y" ] 2> /dev/null || [ $yesornolast = "Y" ] 2> /dev/null; then
						echo ""
						read -p 'Tai khoan nay se bi xoa! Chac chan khong? [Y/N]: ' yesornolast1
						printf "${reset}"
						if [ $yesornolast1 = "y" ] 2> /dev/null || [ $yesornolast1 = "Y" ] 2> /dev/null; then
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
	else
		if [ -f ~/../usr/etc/FullNV ] 2> /dev/null; then
			clear
			printf "${green}\nMENU Ninja School\n"
			printf "${red}By KhanhNguyen9872\n\n"
			printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
			printf "${blue} Current: FullNhiemVu-2022\n\n${yellow}"
			printf "0. Xem thong tin tai khoan\n1. Dang ky tai khoan\n2. Lock/Unlock tai khoan\n3. Mat khau [Doi pass, Lay pass,...]\n4. Buff [Luong, Yen, Xu, Level,...]\n5. Reset [Tiem nang]\n6. Backup/Restore your data\n7. More...\n8. Settings\n9. Xoa tai khoan\nK. Thoat (Exit)\n\n${light_cyan}"
			read -p "Lua chon: " khanh
			case ${khanh} in
				8)
					keep_on=1
					while [[ $keep_on -eq 1 ]] 2> /dev/null; do
						if [ -f ~/../usr/etc/HOIUC ] 2> /dev/null; then
							source="HOIUC-2022"
						else
							if [ -f ~/../usr/etc/FullNV ] 2> /dev/null; then
								source="FullNhiemVu-2022"
							else
								source="Unknown"
							fi
						fi
						clear
						printf "${green}\nMENU Ninja School\n"
						printf "${red}By KhanhNguyen9872\n\n"
						printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n"
						printf "${green}\nSettings\n\n"
						printf "${yellow}\n 1. Change Source [Current: $source]\n K. Thoat ra menu\n\n${light_cyan}"
						read -p "Lua chon: " khanhsource
						case ${khanhsource} in
							1)
								if [ $source = "HOIUC-2022" ] 2> /dev/null; then
									rm -f ~/../usr/etc/HOIUC 2> /dev/null
									echo 'KhanhNguyen9872' > ~/../usr/etc/FullNV
								else
									if [ $source = "FullNhiemVu-2022" ] 2> /dev/null; then
										rm -f ~/../usr/etc/FullNV 2> /dev/null
										echo 'KhanhNguyen9872' > ~/../usr/etc/HOIUC
									fi
								fi
							;;
							*)
								if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
									keep_on=0
								fi
							;;
						esac
					done
				;;
				6)
					keep_on=1
					while [[ $keep_on -eq 1 ]]; do
						clear
						printf "${green}\nMENU Ninja School\n"
						printf "${red}By KhanhNguyen9872\n\n"
						printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n"
						printf "${yellow}\n1. Backup your data\n2. Restore your data\nK. Thoat ra menu\n\n${light_cyan}"
						read -p "Lua chon: " khanh
						case ${khanh} in
							1)
								clear
								printf "${green}\nMENU Ninja School\n"
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${yellow} Backup your data\n"
								printf " File: /sdcard/khanh_nja.backup [Internal Storage]\n\n${light_cyan}"
								read -p "Do you want to backup it? [Y/N] " yesorno
								printf "\n"
								if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
									check_apache2="$(curl -s -X POST http://localhost:8080)"
									if [ -z $check_apache2 ] || ! ps -C httpd >/dev/null; then
										clear
										printf "${red}\n\n !!! MySQL is not running !!!\n\nExiting...\n\n"
										exit 0
									else
										if [ -f /sdcard/khanh_nja.backup ] 2> /dev/null; then
											rm -f /sdcard/khanh_nja.backup 2> /dev/null
										fi
										mysqldump -u root --databases khanh1 >> /sdcard/khanh_nja_FULLNV.backup
										if [ -f /sdcard/khanh_nja.backup ] 2> /dev/null; then
											printf "${light_cyan}\n\n Backup completed!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										else
											printf "${red}\n\n Backup failed!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										fi
									fi
								fi
							;;
							2)
								clear
								printf "${green}\nMENU Ninja School\n"
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${yellow} Restore your data\n\n Example:\n"
								printf " /sdcard/khanh_nja.backup\n\n${light_cyan}"
								read -p "File Restore in: " restorefile
								printf "\n${green}"
								read -p "Do you want to restore it? [Y/N] " yesorno
								if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
									printf "${red}\n\n WARNING: ALL DATA CURRENT WILL BE DESTROYED!\n"
									read -p "Ban co chac chan muon tiep tuc? [Y/N] " yesorno1
									if [ $yesorno1 = "y" ] 2> /dev/null || [ $yesorno1 = "Y" ] 2> /dev/null; then
										if [ $restorefile = "" ] 2> /dev/null || [ -z $restorefile ] 2> /dev/null; then
											printf "\n${red} Ban da nhap sai duong dan file!\n${reset}"
											read -p 'Press Enter to exit!' pause
										else
											if [ -f $restorefile ] 2> /dev/null; then
												check_apache2="$(curl -s -X POST http://localhost:8080)"
												if [ -z $check_apache2 ] || ! ps -C httpd >/dev/null; then
													clear
													printf "${red}\n\n !!! MySQL is not running !!!\n\nExiting...\n\n"
													exit 0
												else
													mysql -u root -e "DROP DATABASE IF EXISTS khanh1; CREATE DATABASE khanh1;"
													mysql -u root khanh1 < $restorefile
													printf "\n${light_cyan} Restore completed!\n\n${reset}"
													read -p 'Press Enter to exit!' pause
												fi
											else
												printf "\n${red} File Restore khong ton tai! [NOT FOUND]\n${reset}"
												read -p 'Press Enter to exit!' pause
											fi
										fi
									fi
								fi
							;;
							*)
								if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
									keep_on=0
								fi
							;;
						esac
					done

				;;
				0)
					clear
					printf "${green}\nMENU Ninja School\n"
					printf "${red}By KhanhNguyen9872\n\n"
					printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n"
					printf "${green}\nXem thong tin tai khoan Ninja School\n\n"
					read -p 'Ten tai khoan: ' username
					if [ ! -z $username ] 2> /dev/null; then
						username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
						if [ $username_check = $username ] 2> /dev/null; then
							khanhnguyen9872="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
							if [ -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 = "" ] 2> /dev/null; then
								khanhnguyen9872="Chua tao nhan vat Ninja"
								user_gender="Unknown"
								user_level="0"
								user_class="Unknown"
								user_xu="0"
								user_xuBox="0"
								user_yen="0"
								user_classpt="Unknown"
								user_speed="0"
								user_speedpt="0"
								user_levelpt="0"
							else
								user_speed="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT speed FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
								user_speedpt="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT speed FROM clone_ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
								user_level="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT level FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
								user_class="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT class FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
								user_levelpt="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT level FROM clone_ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
								user_classpt="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT class FROM clone_ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
								user_gender="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT gender FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
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
								if [[ $user_classpt = "0" ]] 2> /dev/null; then
									user_classpt="Chua vao lop"
								else
									if [[ $user_class = "1" ]] 2> /dev/null; then
										user_classpt="Ninja Kiem [Hirosaki]"
									else
										if [[ $user_class = "2" ]] 2> /dev/null; then
											user_classpt="Ninja Phi Tieu [Hirosaki]"
										else
											if [[ $user_class = "3" ]] 2> /dev/null; then
												user_classpt="Ninja Kunai [Ookaza]"
											else
												if [[ $user_class = "4" ]] 2> /dev/null; then
													user_classpt="Ninja Cung [Ookaza]"
												else
													if [[ $user_class = "5" ]] 2> /dev/null; then
														user_classpt="Ninja Dao [Haruna]"
													else
														if [[ $user_class = "6" ]] 2> /dev/null; then
															user_classpt="Ninja Quat [Haruna]"
														else
															user_classpt="Khong the xac dinh"
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
								user_nv="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT taskId FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
								user_xu="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT xu FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
								user_xuBox="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT xuBox FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
								user_yen="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT yen FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
							fi
							user_luong="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT luong FROM player WHERE username='$username'")" 2> /dev/null
							user_trangthai="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT ban FROM player WHERE username='$username'")" 2> /dev/null
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
							printf "${red}By KhanhNguyen9872\n\n"
							printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
							printf "${green}\nXem thong tin tai khoan Ninja School\n\n\n"
							printf "${yellow} Ten tai khoan: $username\n"
							printf " Ten Ninja: $khanhnguyen9872\n"
							printf " Gioi tinh: $user_gender\n"
							printf " Level: $user_level\n"
							printf " Lop: $user_class\n"
							printf " ID Nhiem vu: $user_nv\n"
							printf " Toc chay: $user_speed\n"
							printf " Xu: $user_xu\n"
							printf " Xu giu ruong: $user_xuBox\n"
							printf " Yen: $user_yen\n"
							printf " Luong: $user_luong\n"
							printf " Level [Phan Than]: $user_levelpt\n"
							printf " Lop [Phan Than]: $user_classpt\n"
							printf " Toc chay [Phan Than]: $user_speedpt\n"
							printf " Trang thai: $user_trangthai\n\n\n"
							read -p 'Press Enter to exit!' pause
						else
							printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
							read -p 'Press Enter to exit!' pause
						fi
					fi
				;;
				3)
					keep_on=1
					while [[ $keep_on -eq 1 ]]; do
						clear
						printf "${green}\nMENU Ninja School\n"
						printf "${red}By KhanhNguyen9872\n\n"
						printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n${yellow}"
						printf "1. Lay mat khau hien tai\n2. Doi mat khau\nK. Thoat ra menu\n\n${light_cyan}"
						read -p 'Lua chon: ' khanh
						case ${khanh} in
							1)
								clear
								printf "${green}\nMENU Ninja School\n"
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n"
								printf "${green}\nLay mat khau hien tai Ninja School\n\n"
								read -p 'Ten tai khoan: ' username
								username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
								if [ $username_check = $username ] 2> /dev/null; then
									matkhau_khanh="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT password FROM player WHERE username='$username';")" 2> /dev/null
									printf "${yellow}\n Mat khau hien tai: "
					                echo "$matkhau_khanh"
					                printf "\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								else
									printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								fi
							;;
							2)
								clear
								printf "${green}\nMENU Ninja School\n"
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n"
								printf "${green}\nDoi mat khau Ninja School\n\n"
								read -p 'Ten tai khoan: ' username
								read -p 'Mat khau hien tai: ' password
								read -p 'Mat khau moi: ' passwordnew
								read -p 'Nhap lai mat khau moi: ' repassword
								if [ -z $username ] 2> /dev/null || [ -z $password ] 2> /dev/null || [ -z $repassword ] 2> /dev/null || [ -z $passwordnew ] 2> /dev/null; then
									printf "${red}\n !!! Thong tin khong hop le !!!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								else
									username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
									if [ $username_check = $username ] 2> /dev/null && [ ! -z $username_check ] 2> /dev/null; then
										if [ $passwordnew = $repassword ] 2> /dev/null; then
											matkhau_khanh="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT password FROM player WHERE username='$username';")" 2> /dev/null
											if [ $matkhau_khanh = $password ] 2> /dev/null; then
												mysql --user=root -D khanh1 -e "UPDATE player SET password='$passwordnew' WHERE username='$username';"
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
							*)
								if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
									keep_on=0
								fi
							;;
						esac
					done
				;;
				1)
					clear
					printf "${green}\nMENU Ninja School\n"
					printf "${red}By KhanhNguyen9872\n\n"
					printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n"
					printf "${green}\nDang ky tai khoan Ninja School\n\n"
					read -p 'Ten tai khoan: ' username
					read -p 'Mat khau: ' password
					read -p 'Nhap lai mat khau: ' repassword
					if [ -z $username ] 2> /dev/null || [ -z $password ] 2> /dev/null || [ -z $repassword ] 2> /dev/null; then
						printf "${red}\n !!! Thong tin dang ky khong hop le !!!\n\n${reset}"
						read -p 'Press Enter to exit!' pause
					else
						if [[ $password -eq $repassword ]] 2> /dev/null || [ $password = $repassword ] 2> /dev/null; then
							username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
							if [ $username_check = $username ] 2> /dev/null; then
								printf "${red}\n !!! Tai khoan nay da ton tai !!!\n\n${reset}"
								read -p 'Press Enter to exit!' pause
							else
								mysql --user=root -D khanh1 << EOF
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
					keep_on=1
					while [[ $keep_on -eq 1 ]]; do
						clear
						printf "${green}\nMENU Ninja School\n"
						printf "${red}By KhanhNguyen9872\n\n${yellow}"
						printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n${yellow}"
						printf "1. Lock tai khoan\n2. Unlock tai khoan\nK. Thoat ra menu\n\n${light_cyan}"
						read -p 'Lua chon: ' khanh
						case ${khanh} in
							1)
								clear
								printf "${green}\nMENU Ninja School\n"
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${green}\nLock tai khoan Ninja School\n\n"
								read -p 'Ten tai khoan: ' username
								printf "${red}\n"
								read -p 'Ban co muon khoa tai khoan nay khong? [Y/N]: ' yesorno
								printf "${reset}"
								if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
									username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
									if [ $username_check = $username ] 2> /dev/null; then
										mysql --user=root -D khanh1 -e "UPDATE player SET ban = replace(ban,'0','1') WHERE username='$username';"
										printf "\n${yellow} Khoa tai khoan $username thanh cong!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									fi
								fi
							;;
							2)
								clear
								printf "${green}\nMENU Ninja School\n"
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${green}\nUnlock tai khoan Ninja School\n\n"
								read -p 'Ten tai khoan: ' username
								printf "${red}\n"
								read -p 'Ban co muon mo khoa tai khoan nay khong? [Y/N]: ' yesorno
								printf "${reset}"
								if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
									username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
									if [ $username_check = $username ] 2> /dev/null; then
										mysql --user=root -D khanh1 -e "UPDATE player SET ban = replace(ban,'1','0') WHERE username='$username';"
										printf "\n${yellow} Mo khoa tai khoan $username thanh cong!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									fi
								fi
							;;
							*)
								if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
									keep_on=0
								fi
							;;
						esac
					done
				;;
				4)
					keep_on=1
					while [[ $keep_on -eq 1 ]]; do
						clear
						printf "${green}\nMENU Ninja School\n"
						printf "${red}By KhanhNguyen9872\n\n"
						printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
						printf "${yellow}0. Nhiem vu\n1. Buff Luong\n2. Buff Xu\n3. Buff Yen\n4. Buff Level\n5. Buff Level Phan than\n6. Buff Toc chay\n7. Buff Tiem nang\n8. Buff Ky nang\n9. Buff Level Tu tien [Thu nghiem]\nK. Thoat ra menu\n\n${light_cyan}"
						read -p 'Lua chon: ' khanh
						case ${khanh} in
							0)
							keep_on1=1
							while [[ $keep_on1 -eq 1 ]]; do
								clear
								printf "${green}\nMENU Ninja School\n"
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${yellow}1. Skip nhiem vu hien tai\n2. Quay ve nhiem vu truoc\nK. Thoat ra menu\n\n${light_cyan}"
								read -p 'Lua chon: ' khanh
								case ${khanh} in
									1)
										clear
										printf "${green}\nMENU Ninja School\n"
										printf "${red}By KhanhNguyen9872\n\n"
										printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
										printf "${green}\nSkip Nhiem vu hien tai Ninja School\n\n"
										printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi skip\n\n"
										read -p 'Ten tai khoan: ' username
										printf "${red}\n"
										read -p 'Ban co muon skip nhiem vu hien tai khong? [Y/N]: ' yesorno
										printf "${reset}"
										if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
											username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
											if [ $username_check = $username ] 2> /dev/null; then
												khanhnguyen9872="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
												if [ -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 = "" ] 2> /dev/null; then
													printf "\n${red} !!! Tai khoan nay chua tao nhan vat !!!\n\n${reset}"
													read -p 'Press Enter to exit!' pause
												else
													user_nv="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT taskId FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
													if [[ $user_nv -eq 50 ]] 2> /dev/null; then
														printf "\n${yellow} Nhan vat nay da lam het nhiem vu!\n\n${reset}"
														read -p 'Press Enter to exit!' pause
													else
														user_nv=$(( $user_nv + 1 ))
														mysql --user=root -D khanh1 -e "UPDATE ninja SET taskId = '$user_nv' WHERE username='$khanhnguyen9872';"
														printf "\n${yellow} Skip nhiem vu ${user_nv} cho [${username}] thanh cong!\n\n${reset}"
														read -p 'Press Enter to exit!' pause
													fi
												fi
											else
												printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											fi
										fi
									;;
									2)
										clear
										printf "${green}\nMENU Ninja School\n"
										printf "${red}By KhanhNguyen9872\n\n"
										printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
										printf "${green}\Quay ve nhiem vu truoc Ninja School\n\n"
										printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi quay ve\n\n"
										read -p 'Ten tai khoan: ' username
										printf "${red}\n"
										read -p 'Ban co muon quay ve nhiem vu truoc khong? [Y/N]: ' yesorno
										printf "${reset}"
										if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
											username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
											if [ $username_check = $username ] 2> /dev/null; then
												khanhnguyen9872="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
												if [ -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 = "" ] 2> /dev/null; then
													printf "\n${red} !!! Tai khoan nay chua tao nhan vat !!!\n\n${reset}"
													read -p 'Press Enter to exit!' pause
												else
													user_nv="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT taskId FROM ninja WHERE name='$khanhnguyen9872'")" 2> /dev/null
													if [[ $user_nv -eq 1 ]] 2> /dev/null; then
														printf "\n${yellow} Nhan vat nay dang o nhiem vu dau tien!\n\n${reset}"
														read -p 'Press Enter to exit!' pause
													else
														user_nv=$(( $user_nv - 1 ))
														mysql --user=root -D khanh1 -e "UPDATE ninja SET taskId = '$user_nv' WHERE username='$khanhnguyen9872';"
														printf "\n${yellow} Skip nhiem vu ${user_nv} cho [${username}] thanh cong!\n\n${reset}"
														read -p 'Press Enter to exit!' pause
													fi
												fi
											else
												printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											fi
										fi
									;;
									*)
										if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
											keep_on=0
										fi
									;;
								esac
							done
							;;
							1)
								clear
								printf "${green}\nMENU Ninja School\n"
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${green}\nBuff Luong Ninja School\n\n"
								printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
								read -p 'Ten tai khoan: ' username
								read -p 'Nhap so Luong: ' luong
								printf "${red}\n"
								read -p 'Ban co muon buff luong khong? [Y/N]: ' yesorno
								printf "${reset}"
								if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
									if [[ $luong -gt 2000000000 ]] 2> /dev/null || [[ $luong -lt 0 ]] 2> /dev/null; then
										printf "\n${red} !!! So Luong khong hop le (0 - 2.000.000.000) !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
										if [ $username_check = $username ] 2> /dev/null; then
											mysql --user=root -D khanh1 -e "UPDATE player SET luong = '$luong' WHERE username='$username';"
											printf "\n${yellow} Buff ${luong} Luong cho [${username}] thanh cong!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										else
											printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										fi
									fi
								fi
							;;
							2)
								clear
								printf "${green}\nMENU Ninja School\n"
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${green}\nBuff Xu Ninja School\n\n"
								printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
								read -p 'Ten tai khoan: ' username
								read -p 'Nhap so Xu: ' xu
								printf "${red}\n"
								read -p 'Ban co muon buff xu khong? [Y/N]: ' yesorno
								printf "${reset}"
								if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
									if [[ $xu -gt 2000000000 ]] 2> /dev/null || [[ $xu -lt 0 ]] 2> /dev/null; then
										printf "\n${red} !!! So Xu khong hop le (0 - 2.000.000.000) !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
										if [ $username_check = $username ] 2> /dev/null; then
											khanhnguyen9872="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
											if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
											mysql --user=root -D khanh1 -e "UPDATE ninja SET xu = '$xu' WHERE name='$khanhnguyen9872';"
												printf "\n${yellow} Buff ${xu} Xu cho [${username}] thanh cong!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											else
												printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
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
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${green}\nBuff Yen Ninja School\n\n"
								printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
								read -p 'Ten tai khoan: ' username
								read -p 'Nhap so Yen: ' yen
								printf "${red}\n"
								read -p 'Ban co muon buff Yen khong? [Y/N]: ' yesorno
								printf "${reset}"
								if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
									if [[ $yen -gt 2000000000 ]] 2> /dev/null || [[ $yen -lt 0 ]] 2> /dev/null; then
										printf "\n${red} !!! So Yen khong hop le (0 - 2.000.000.000) !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
										if [ $username_check = $username ] 2> /dev/null; then
											khanhnguyen9872="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
											if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
												mysql --user=root -D khanh1 -e "UPDATE ninja SET yen = '$yen' WHERE name='$khanhnguyen9872';"
												printf "\n${yellow} Buff ${yen} Yen cho [${username}] thanh cong!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											else
												printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											fi					
										else
											printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										fi
									fi
								fi
							;;
							4)
								clear
								printf "${green}\nMENU Ninja School\n"
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${green}\nBuff Level Ninja School\n\n"
								printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
								read -p 'Ten tai khoan: ' username
								read -p 'Nhap Level: ' level
								printf "${red}\n"
								read -p 'Ban co muon buff Level khong? [Y/N]: ' yesorno
								printf "${reset}"
								if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
									if [[ $level -gt 130 ]] 2> /dev/null || [[ $level -lt 1 ]] 2> /dev/null; then
										printf "\n${red} !!! Level khong hop le (1 - 130) !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
										if [ $username_check = $username ] 2> /dev/null; then
											khanhnguyen9872="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
											if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
												printf "\nPlease wait....\n"
												khanhnguyen9872_1=0
												for i in $(seq 1 $level); do khanhnguyen9872_2="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT exps FROM level WHERE level='$i';" | awk -F \| '{ printf $1 }')"; khanhnguyen9872_1=$(( $khanhnguyen9872_1 + $khanhnguyen9872_2 )); done
												if [[ $level -eq 130 ]] 2> /dev/null; then
													khanhnguyen9872_1=$(( $khanhnguyen9872_1 - 500000000 ))
												fi
												mysql --user=root -D khanh1 -e "UPDATE ninja SET level = '$level' WHERE name='$khanhnguyen9872';"
												mysql --user=root -D khanh1 -e "UPDATE ninja SET exp = '$khanhnguyen9872_1' WHERE name='$khanhnguyen9872';"
												printf "\n${yellow} Buff Level ${level} cho [${username}] thanh cong!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											else
												printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											fi					
										else
											printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										fi
									fi
								fi
							;;
							5)
								clear
								printf "${green}\nMENU Ninja School\n"
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${green}\nBuff Level Phan Than Ninja School\n\n"
								printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
								read -p 'Ten tai khoan: ' username
								read -p 'Nhap Level: ' level
								printf "${red}\n"
								read -p 'Ban co muon buff Level Phan Than khong? [Y/N]: ' yesorno
								printf "${reset}"
								if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
									if [[ $level -gt 130 ]] 2> /dev/null || [[ $level -lt 1 ]] 2> /dev/null; then
										printf "\n${red} !!! Level khong hop le (1 - 130) !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
										if [ $username_check = $username ] 2> /dev/null; then
											khanhnguyen9872="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
											if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
												khanhnguyen9872_0="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT level FROM ninja WHERE name='$khanhnguyen9872';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
												if [[ $khanhnguyen9872_0 -lt 90 ]] 2> /dev/null; then
													printf "\n${red} !!! Ninja ${khanhnguyen9872} chua du level 90 tro len !!!\n\n${reset}"
													read -p 'Press Enter to exit!' pause
												else
													printf "\nPlease wait....\n"
													khanhnguyen9872_1=0
													for i in $(seq 1 $level); do khanhnguyen9872_2="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT exps FROM level WHERE level='$i';" | awk -F \| '{ printf $1 }')"; khanhnguyen9872_1=$(( $khanhnguyen9872_1 + $khanhnguyen9872_2 )); done
													if [[ $level -eq 130 ]] 2> /dev/null; then
														khanhnguyen9872_1=$(( $khanhnguyen9872_1 - 500000000 ))
													fi
													mysql --user=root -D khanh1 -e "UPDATE clone_ninja SET level = '$level' WHERE name='$khanhnguyen9872';"
													mysql --user=root -D khanh1 -e "UPDATE clone_ninja SET exp = '$khanhnguyen9872_1' WHERE name='$khanhnguyen9872';"
													printf "\n${yellow} Buff Level ${level} cho [${username}] thanh cong!\n\n${reset}"
													read -p 'Press Enter to exit!' pause
												fi
											else
												printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											fi					
										else
											printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										fi
									fi
								fi
							;;
							6)
								clear
								printf "${green}\nMENU Ninja School\n"
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${green}\nBuff Toc chay Ninja School\n\n"
								printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
								read -p 'Ten tai khoan: ' username
								read -p 'Nhap so toc chay: ' tocchay
								printf "${red}\n"
								read -p 'Ban co muon buff Level khong? [Y/N]: ' yesorno
								printf "${reset}"
								if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
									if [[ $tocchay -gt 12 ]] 2> /dev/null || [[ $tocchay -lt 1 ]] 2> /dev/null; then
										printf "\n${red} !!! Toc chay khong hop le (1 - 12) !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
										if [ $username_check = $username ] 2> /dev/null; then
											khanhnguyen9872="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
											if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
												mysql --user=root -D khanh1 -e "UPDATE ninja SET speed = '$tocchay' WHERE name='$khanhnguyen9872';"
												printf "\n${yellow} Buff Toc chay ${tocchay} cho [${username}] thanh cong!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											else
												printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											fi					
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
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${green}\nBuff Tiem nang Ninja School\n\n"
								printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
								read -p 'Ten tai khoan: ' username
								read -p 'Nhap so Tiem nang: ' tiemnang
								printf "${red}\n"
								read -p 'Ban co muon buff Tiem nang khong? [Y/N]: ' yesorno
								printf "${reset}"
								if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
									if [[ $tiemnang -gt 32500 ]] 2> /dev/null || [[ $tiemnang -lt 100 ]] 2> /dev/null; then
										printf "\n${red} !!! Tiem nang khong hop le (100 - 32.500) !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
										if [ $username_check = $username ] 2> /dev/null; then
											khanhnguyen9872="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
											if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
												mysql --user=root -D khanh1 -e "UPDATE ninja SET ppoint = '$tiemnang' WHERE name='$khanhnguyen9872';"
												printf "\n${yellow} Buff Tiem nang ${tiemnang} cho [${username}] thanh cong!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											else
												printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
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
								printf "${red}By KhanhNguyen9872\n\n"
								printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
								printf "${green}\nBuff Ky nang Ninja School\n\n"
								printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
								read -p 'Ten tai khoan: ' username
								read -p 'Nhap so Ky nang: ' kynang
								printf "${red}\n"
								read -p 'Ban co muon buff Ky nang khong? [Y/N]: ' yesorno
								printf "${reset}"
								if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
									if [[ $kynang -gt 150 ]] 2> /dev/null || [[ $kynang -lt 1 ]] 2> /dev/null; then
										printf "\n${red} !!! Ky nang khong hop le (1 - 150) !!!\n\n${reset}"
										read -p 'Press Enter to exit!' pause
									else
										username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
										if [ $username_check = $username ] 2> /dev/null; then
											khanhnguyen9872="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
											if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
												mysql --user=root -D khanh1 -e "UPDATE ninja SET spoint = '$kynang' WHERE name='$khanhnguyen9872';"
												printf "\n${yellow} Buff Ky nang ${kynang} cho [${username}] thanh cong!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											else
												printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
												read -p 'Press Enter to exit!' pause
											fi					
										else
											printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
											read -p 'Press Enter to exit!' pause
										fi
									fi
								fi
							;;
							*)
								if [ $khanh = "k" ] 2> /dev/null || [ $khanh = "K" ] 2> /dev/null; then
									keep_on=0
								fi
							;;
						esac
					done
				;;
				5)
					clear
					printf "${green}\nMENU Ninja School\n"
					printf "${red}By KhanhNguyen9872\n\n"
					printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
					printf "${green}\nReset Tiem nang Ninja School\n\n"
					printf "${lightcyan} WARNING: Vui long khong dang nhap trong khi buff\n\n"
					read -p 'Ten tai khoan: ' username
					printf "${red}\n"
					read -p 'Ban co muon reset Tiem nang khong? [Y/N]: ' yesorno
					if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
						read -p 'Toan bo Tiem nang se reset! Ban chac chan khong? [Y/N]: ' yesorno1
						printf "${reset}"
						if [ $yesorno1 = "y" ] 2> /dev/null || [ $yesorno1 = "Y" ] 2> /dev/null; then
							username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
							if [ $username_check = $username ] 2> /dev/null; then
								khanhnguyen9872="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
								if [ ! -z $khanhnguyen9872 ] 2> /dev/null || [ $khanhnguyen9872 != "" ] 2> /dev/null; then
									mysql --user=root -D khanh1 -e "UPDATE ninja SET ppoint = '100' WHERE name='$khanhnguyen9872';"
									mysql --user=root -D khanh1 -e "UPDATE ninja SET potential1 = '15' WHERE name='$khanhnguyen9872';"
									mysql --user=root -D khanh1 -e "UPDATE ninja SET potential2 = '5' WHERE name='$khanhnguyen9872';"
									mysql --user=root -D khanh1 -e "UPDATE ninja SET potential3 = '5' WHERE name='$khanhnguyen9872';"
									mysql --user=root -D khanh1 -e "UPDATE ninja SET potential4 = '5' WHERE name='$khanhnguyen9872';"
									printf "\n${yellow} Reset Tiem nang cho [${username}] thanh cong!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								else
									printf "\n${red} !!! Tai khoan nay chua tao nhan vat Ninja !!!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								fi					
							else
								printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
								read -p 'Press Enter to exit!' pause
							fi
						fi
					fi
				;;
				9)
					clear
					printf "${green}\nMENU Ninja School\n"
					printf "${red}By KhanhNguyen9872\n\n"
					printf "${light_cyan} Github: https://github.com/khanhnguyen9872\n Facebook: https://fb.me/khanh10a1\n\n"
					printf "${red}\nXoa tai khoan Ninja School\n\n${green}"
					read -p 'Ten tai khoan: ' username
					printf "${red}\n"
					read -p 'Ban co muon xoa tai khoan nay khong? [Y/N]: ' yesorno
					if [ $yesorno = "y" ] 2> /dev/null || [ $yesorno = "Y" ] 2> /dev/null; then
						echo ""
						read -p 'Ban co chac chan xoa tai khoan nay hay khong? [Y/N]: ' yesornolast
						if [ $yesornolast = "y" ] 2> /dev/null || [ $yesornolast = "Y" ] 2> /dev/null; then
							echo ""
							read -p 'Tai khoan nay se bi xoa! Chac chan khong? [Y/N]: ' yesornolast1
							printf "${reset}"
							if [ $yesornolast1 = "y" ] 2> /dev/null || [ $yesornolast1 = "Y" ] 2> /dev/null; then
								username_check="$(mysql --user=root -D khanh1 --skip-column-names -e "SELECT * FROM player WHERE username='$username';" | grep -o $username | sed '1p;/pattern/!d')"
								if [ $username_check = $username ] 2> /dev/null; then
									khanhnguyen9872="$(mysql -u root -D khanh1 --skip-column-names -e "SELECT ninja FROM player WHERE username='$username';" | awk -F \| '{ printf $1 }' | sed 's/\"//g' | sed 's/\[//g' | sed 's/\]//g')"
									mysql --user=root -D khanh1 --skip-column-names -e "DELETE FROM player WHERE username='$username';"
									mysql --user=root -D khanh1 --skip-column-names -e "DELETE FROM ninja WHERE name='$khanhnguyen9872';"
									mysql --user=root -D khanh1 -e "UPDATE player SET ban = replace(ban,'1','0') WHERE username='$username';"
									printf "\n${yellow} Xoa tai khoan $username thanh cong!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								else
									printf "\n${red} !!! Tai khoan nay khong ton tai !!!\n\n${reset}"
									read -p 'Press Enter to exit!' pause
								fi
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
		else
			printf "${red}\n Sai source!! Vui long cai dat lai!!!\n\n${reset}"
			exit 0
		fi
	fi
	unset check_apache2
	unset khanh
	unset restorefile
	unset pause
	unset user_gender
	unset user_class
	unset user_trangthai
	unset user_xu
	unset user_nv
	unset user_xuBox
	unset user_yen
	unset user_luong
	unset user_level
	unset user_speed
	unset user_speedpt
	unset user_classpt
	unset user_levelpt
	unset khanhnguyen9872
	unset khanhnguyen9872_0
	unset khanhnguyen9872_1
	unset khanhnguyen9872_2
	unset xu
	unset level
	unset yesorno
	unset username_check
	unset username
	unset luong
	unset tocchay
	unset tiemnang
	unset kynang
	unset yen
	unset repassword
	unset password
done
