FROM archlinux/base
RUN pacman -Syu --noconfirm base sudo docker git && yes | pacman -Scc --noconfirm
