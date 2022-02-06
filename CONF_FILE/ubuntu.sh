#!/data/data/com.termux/files/usr/bin/bash
cd $(dirname $0)
cd 2> /dev/null && cd ../usr/share/KhanhNguyen9872 2> /dev/null
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" --kill-on-exit"
command+=" -r ubuntu-fs"
if [ -n "$(ls -A ubuntu-binds)" ]; then
    for f in ubuntu-binds/* ;do
      . $f
    done
fi
command+=" -b /proc"
command+=" -b ubuntu-fs/tmp:/dev/shm"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="$@"
$command -c "khanh"
