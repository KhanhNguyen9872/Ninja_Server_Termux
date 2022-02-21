red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'
clear
if [ -f ~/../usr/var/lib/khanhp ] 2> /dev/null; then
	left=4
	cd ~/../
	khanh1="$(grep '' './usr/var/lib/khanhp')"
	while [[ $left -eq 4 ]] || [[ $left -eq 3 ]] || [[ $left -eq 2 ]] || [[ $left -eq 1 ]]; do
		clear
		if [[ $wrong -eq 1 ]]; then
			printf "\n ${red} - Wrong Password! $left attempts left! ${reset}\n\n"
		fi
		if [[ $left -eq 0 ]]; then
			clear
			printf "\n\n ${red} - Wrong Password! Exit! ${reset}\n\n"
			exit 0
		fi
		printf "${light_cyan}\n   Type your Password! ${reset}\n\n"
		read -p "Password: " anykey
		if [[ $anykey -eq $khanh1 ]] 2> /dev/null || [ $anykey = $khanh1 ] 2> /dev/null; then
			printf "\n ${yellow} - PASS! ${reset}\n"
			newpass=1
			break
		else
			wrong=1
			left=$((left-1))
		fi
	done
	if [[ $left -eq 0 ]]; then
		clear
		printf "\n\n ${red} - Wrong Password! Exit! ${reset}\n\n"
		exit 0
	fi
fi
cd 2> /dev/null
clear
echo '(KhanhNguyen9872)'
echo 'How to start Ninja School?'
echo '1. Run: [tamp -start]'
echo '2. Start New Session, run [ninja]'
echo ''
if [ -f ~/../usr/etc/HOIUC ] 2> /dev/null; then echo 'Current: HOIUC-2022'; else if [ -f ~/../usr/etc/FullNV ] 2> /dev/null; then echo 'Current: FullNhiemVu-2022'; else echo 'Current: ERROR'; fi fi
echo ""
termux-wake-lock 2> /dev/null
