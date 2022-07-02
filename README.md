<h1 align="center">Welcome to Ninja_Server_Termux 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-8.2-blue.svg?cacheSeconds=2592000" />
  <a href="https://github.com/KhanhNguyen9872/Ninja_Server_Termux#" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="https://github.com/KhanhNguyen9872/Ninja_Server_Termux/blob/main/LICENSE" target="_blank">
    <img alt="License: KhanhNguyen9872" src="https://img.shields.io/badge/License-KhanhNguyen9872-yellow.svg" />
  </a>
  <a href="https://twitter.com/khanh9872" target="_blank">
    <img alt="Twitter: khanh9872" src="https://img.shields.io/twitter/follow/khanh9872.svg?style=social" />
  </a>
  
  [![Github All Releases](https://img.shields.io/github/downloads/KhanhNguyen9872/Ninja_Server_Termux/total.svg?style=for-the-badge)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux#)
  [![Github All Releases](https://img.shields.io/github/release/KhanhNguyen9872/Ninja_Server_Termux.svg?style=for-the-badge)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux#)
</p>

> Ninja School Server on Termux Android

### 🏠 [Homepage](https://github.com/KhanhNguyen9872/Ninja_Server_Termux#)

### ✨ [Demo Server](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/blob/main/DEMO.md)

# Mua Key Server FullNhiemVu-VIP-2022 [MoonSmile]?
 - Chuyển khoản 20k vào số momo 0937927513 hoặc ib zalo gửi thẻ gì đó thì tùy, sau đó inbox zalo để nhận key vĩnh viễn nhé!
 - Lưu ý! Nên cài và sử dụng các server free khác trước khi mua server này! Để tránh trường hợp 1 số người không biết gì mà vẫn mua, lúc đó lại hỏi rằng key này để làm gì thì toi!

## Install
 - Tutorial: [https://youtu.be/puTeSrOrfL4](https://youtu.be/Wyt_f7hEoCQ)
1. Download Termux APK (click on Picture): 
[![](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/raw/main/image/termux.png)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/releases/download/NinjaServerTermuxv01/termux_0.118.apk)

2. Install Termux APK

3. Open Termux, copy this line and paste it on Termux

```bash
clear; printf "\n Sau khi cài đặt, mọi quyền hạn và tính năng của Termux sẽ thuộc về NinjaServerTermux\n Ví dụ như bạn không thể apt install bất kì cái gì, kể cả dpkg\n\n Nếu bạn muốn quay về ban đầu, hãy cài đặt lại Termux\n\n - Bạn có muốn tiếp tục? [Y/N]\n\n"; read -p "Lựa chọn: " yesorno; if [[ $yesorno == "Y" ]] || [[ $yesorno == "y" ]]; then printf "\n\n"; echo "Y" | termux-setup-storage &> /dev/null; url="https://raw.githubusercontent.com/KhanhNguyen9872/Ninja_Server_Termux/main"; cpu="$(getprop ro.product.cpu.abi)"; if [[ $cpu == "arm64-v8a" ]]; then archdeb="aarch64"; else if [[ $cpu == "armeabi-v7a" ]] || [[ $cpu == "armeabi" ]]; then archdeb="arm"; url="${url}/bin32"; else if [[ $cpu == "x86_64" ]]; then archdeb="x64"; url="${url}/binx64"; else exit 0; fi; fi; fi; clear; printf "\nDownloading package....\n\n"; curl -L --max-redirs 15 --progress-bar "https://github.com/KhanhNguyen9872/Ninja_Server_Termux/releases/download/ninja-server-dev/ninja-server-dev_${archdeb}.deb" --output ninja-server-dev.deb || exit 0; echo "Y" | dpkg -i --force-overwrite ninja-server-dev.deb; curl -L --max-redirs 15 --progress-bar "${url}/install.sh" --output install.sh || exit 0; chmod 777 ./install.sh; ./install.sh https://fb.me/khanh10a1; fi
```

4. Wait for install!
 
5. Choose Source you want to use! 
 
6. Enjoy!

## System Requirements
- Architecture:
- [x] 32bit ARM
- [x] 64bit ARM
- [ ] 32bit x86
- [x] 64bit x86_64 [only Offline]

- Android:
- [x] 7
- [x] 8
- [x] 9
- [x] 10
- [x] 11
- [x] 12 [May crash]
- [ ] 13 [Unknown]

## Author

👤 **KhanhNguyen9872**

* Website: KhanhNguyen9872.github.io
* Twitter: [@khanh9872](https://twitter.com/khanh9872)
* Github: [@KhanhNguyen9872](https://github.com/KhanhNguyen9872)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/issues). You can also take a look at the [contributing guide](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/blob/main/README.md).

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2022 [KhanhNguyen9872](https://github.com/KhanhNguyen9872).<br />
This project is [KhanhNguyen9872](https://github.com/KhanhNguyen9872) licensed.

***
