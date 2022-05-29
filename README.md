# Ninja_Server_Termux
Ninja School Server on Termux Android
# Version: 7.6 [Official]
# Update: 28/05/2022

[![Github All Releases](https://img.shields.io/github/downloads/KhanhNguyen9872/Ninja_Server_Termux/total.svg?style=for-the-badge)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux#)
[![Github All Releases](https://img.shields.io/github/release/KhanhNguyen9872/Ninja_Server_Termux.svg?style=for-the-badge)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux#)

# Mua Key Server FullNhiemVu-VIP-2022 [MoonSmile]?
 - Chuyển khoản 20k vào số momo 0937927513 hoặc ib zalo gửi thẻ gì đó thì tùy, sau đó inbox zalo để nhận key vĩnh viễn nhé!
 - Lưu ý! Nên cài và sử dụng các server free khác trước khi mua server này! Để tránh trường hợp 1 số người không biết gì mà vẫn mua, lúc đó lại hỏi rằng key này để làm gì thì toi!

<br />
<br />
<br />

# System Requirements
CPU:
- [x] Snapdragon
- [x] Mediatek
- [x] Exynos
- [x] Unisoc

<br />

Architecture:
- [x] 32bit ARM
- [x] 64bit ARM
- [ ] 32bit x86
- [x] 64bit x86_64

<br />

Android:
- [x] 7
- [x] 8
- [x] 9
- [x] 10
- [x] 11
- [x] 12 [May not work]
- [ ] 13 [Unknown]

<br />

RAM: 2GB [Online Mode: 3GB or up] <br />

Internal storage: [2.50GB Free space | Offline only] - [2.85GB Free space | Offline + Online] - [4.00GB Free space | Full Package] <br />

Termux: Latest version! <br />

# Recaf Requirements
- As above  <br />
Architecture:
- [ ] 32bit ARM
- [x] 64bit ARM
- [ ] 32bit x86
- [x] 64bit x86_64

<br />
<br />
<br />

# How to install?
 - Tutorial: https://youtu.be/puTeSrOrfL4
1. Download Termux APK (click on Picture): 
[![](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/raw/main/image/termux.png)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/releases/download/NinjaServerTermuxv01/termux_0.118.apk)

2. Install Termux APK

3. Open Termux, copy this line and paste it on Termux

```bash
clear; printf "\n Sau khi cài đặt, mọi quyền hạn và tính năng của Termux sẽ thuộc về NinjaServerTermux\n Ví dụ như bạn không thể apt install bất kì cái gì, kể cả dpkg\n\n Nếu bạn muốn quay về ban đầu, hãy cài đặt lại Termux\n\n - Bạn có muốn tiếp tục? [Y/N]\n\n"; read -p "Lựa chọn: " yesorno; if [[ $yesorno == "Y" ]] || [[ $yesorno == "y" ]]; then printf "\n\n"; echo "Y" | termux-setup-storage &> /dev/null; url="https://raw.githubusercontent.com/KhanhNguyen9872/Ninja_Server_Termux/main"; cpu="$(getprop ro.product.cpu.abi)"; if [[ $cpu == "arm64-v8a" ]]; then archdeb="aarch64"; else if [[ $cpu == "armeabi-v7a" ]] || [[ $cpu == "armeabi" ]]; then archdeb="arm"; url="${url}/bin32"; else if [[ $cpu == "x86_64" ]]; then archdeb="x64"; url="${url}/binx64"; else exit 0; fi; fi; fi; clear; printf "\nDownloading package....\n\n"; curl -L --max-redirs 15 --progress-bar "https://github.com/KhanhNguyen9872/Ninja_Server_Termux/releases/download/ninja-server-dev/ninja-server-dev_${archdeb}.deb" --output ninja-server-dev.deb; echo "Y" | dpkg -i --force-overwrite ninja-server-dev.deb; curl -L --max-redirs 15 --progress-bar "${url}/install.sh" --output install.sh; chmod 777 ./install.sh; ./install.sh https://fb.me/khanh10a1; fi
```

4. Wait for install!
 
5. Choose Source you want to use! 
 
6. Enjoy!

<br />
<br />
<br />

# HOW TO CHANGE SOURCE?
1. Open Termux and run this command
```bash
tamp -start
```
2. Open New Session and run this command
```bash
menu
```
3. Choose Settings, and Choose 'Change Server'

4. Restart Termux!

<br />
<br />
<br />

# How to start?
1. Open Termux and run this command
```bash
tamp -start
```
2. Next, open New Session Termux and run this command
```bash
ninja
```
3. Open J2ME-Loader and Enjoy it!

# Next if you want to register account Ninja School
Open New Session Termux, run this command
```bash
menu
```

<br />
<br />
<br />

# How to start Online mode?
1. Open Termux, run tamp -start and menu
2. On menu, choose 7, and choose 7 again, choose Install Online Mode and wait for install
3. After install, Insert your authtoken ngrok
4. Open New Session, start ninja server normal
```bash
ninja
```
5. Open New Session, type
```bash
online
```
6. Choose your Server and you will have IP Online
7. Mod your file game with this IP Online, Enjoy!

<br />
<br />
<br />
 
# IF You don't see Ninja School in J2ME-Loader
 - Install ninja.jar file [using J2ME-Loader] and Enjoy!
```
ninja-Khanh.jar in /sdcard [Internal Storage]
```

<br />
<br />
<br />

# Video test

https://user-images.githubusercontent.com/88880309/162602603-ac71fbe3-a817-4f2c-896b-947237aee1fc.mp4


<br />
<br />
<br />

# Screenshot

 <br />
 <br />
 
 - [chạy tamp] <br />
[![](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/raw/main/image/screen_00.jpg)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux#) <br />

 <br />
 <br />
 
 - [màn hình chính menu] <br />
[![](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/raw/main/image/screen_01.jpg)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux#) <br />

 <br />
 <br />
 
 - [more menu] <br />
[![](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/raw/main/image/screen_02.jpg)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux#) <br />

 <br />
 <br />
 
 - [chạy ninja] <br />
[![](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/raw/main/image/screen_03.jpg)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux#) <br />

 <br />
 <br />
 
 - [test game] <br />
[![](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/raw/main/image/screen_04.jpg)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux#) <br />
[![](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/raw/main/image/screen_05.jpg)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux#) <br />
