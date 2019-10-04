#!/bin/sh
wget -O /tmp/undocker.py https://github.com/larsks/undocker/raw/c951f021e701b4ce61de03eb668a440e69646889/undocker.py
sudo mkdir -p /rootfs
docker pull zaoqi/github-actions-archlinux
docker save zaoqi/github-actions-archlinux | sudo python3 /tmp/undocker.py -o /rootfs zaoqi/github-actions-archlinux
docker rmi zaoqi/github-actions-archlinux
rm -fr /tmp/undocker.py
sudo sh -c "
systemctl stop docker
mkdir /rootfs/old.rootfs
mount --bind / /rootfs/old.rootfs
chroot /rootfs /bin/sh -c '
cd /old.rootfs &&
rm -fr sbin bin lib usr lib64 var/mail var/spool/mail &&
cd /old.rootfs/etc/ &&
cp -Pfr passwd group shadow hosts resolv.conf hostname sudoers sudoers.d /etc/ &&
cd / &&
mv bin lib lib64 sbin usr /old.rootfs
cp -Pfr etc home mnt opt root run srv var /old.rootfs
' &&
umount /rootfs/old.rootfs &&
rm -fr /rootfs/
"
