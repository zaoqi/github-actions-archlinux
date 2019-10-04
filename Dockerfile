FROM archlinux/base
RUN pacman -Syu --noconfirm base sudo docker git && pacman -Scc --noconfirm
