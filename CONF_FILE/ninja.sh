#!/data/data/com.termux/files/usr/bin/bash
#KhanhNguyen9872
if [ -f ~/../usr/bin/termux-backup ] 2> /dev/null; then
  rm -f ~/../usr/bin/termux-backup
fi
cd ~/../usr/share/KhanhNguyen9872 2> /dev/null
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r KhanhNguyen9872"
command+=" -b /proc"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
$command -c "khanh"
