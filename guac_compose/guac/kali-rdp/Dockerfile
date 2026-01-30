FROM kalilinux/kali-rolling

RUN apt-get update && \
    apt-get install -y xfce4 xfce4-goodies xrdp sudo && \
    echo "xfce4-session" > /etc/skel/.xsession && \
    mkdir -p /var/run/xrdp && \
    useradd -m -s /bin/bash kali && \
    echo "kali:kali" | chpasswd && \
	sudo apt-get install dbus-x11 && \
	sudo apt-get install nano  && \
	sed -i 's/^security_layer=.*/security_layer=rdp/' /etc/xrdp/xrdp.ini

	

EXPOSE 3389

CMD ["/usr/sbin/xrdp-sesman", "--nodaemon"]
