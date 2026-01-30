FROM kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    openssh-server sudo net-tools iproute2 nano curl bash \
 && mkdir -p /var/run/sshd \
 && echo 'root:toor' | chpasswd \
 \
 # Force bash, remove zsh
 && sed -i 's|/usr/bin/zsh|/bin/bash|g' /etc/passwd || true \
 && ln -sf /bin/bash /bin/sh \
 && apt-get purge -y zsh || true \
 \
 # 🔥 Kill systemd + journald completely
 && apt-get purge -y libpam-systemd systemd systemd-timesyncd || true \
 && rm -rf /lib/systemd /etc/systemd /var/lib/systemd \
 \
 # Clean bash prompt
 && echo 'export PS1="\\u@\\h:\\w\\$ "' > /root/.bashrc \
 \
 # SSH config
 && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
