FROM nginx:1.17

COPY . /usr/share/nginx/html

RUN apt update && apt install  openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 Hnb5cp 

RUN  echo 'Hnb5cp:pKd4WXHu2A57Y6dL' | chpasswd

RUN service ssh start

COPY sshd_config /etc/ssh/sshd_config

EXPOSE 22222
EXPOSE 80

# CMD ["/usr/sbin/sshd","-D"]
ENTRYPOINT "entry.sh"
