FROM kalilinux/kali-rolling

RUN apt-get update && \
    apt-get install -y xfce4 xfce4-goodies xrdp sudo && \
    echo "xfce4-session" > /etc/skel/.xsession && \
    mkdir -p /var/run/xrdp && \
    useradd -m -s /bin/bash kali && \
    echo "kali:kali" | chpasswd && \
	apt-get install dbus-x11 && \
	apt-get install nano  && \
	sed -i 's/^security_layer=.*/security_layer=rdp/' /etc/xrdp/xrdp.ini && \
	mkdir -p /start

COPY start.sh /start/start.sh
RUN chmod +x /start/start.sh

EXPOSE 3389

CMD ["/start/start.sh"]

