FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install LXDE + XRDP
RUN apt update && apt install -y \
    lxde-core lxterminal lxappearance \
    xrdp dbus-x11 sudo wget curl \
    && apt clean

# Create user
RUN useradd -m user && echo "user:1234" | chpasswd && adduser user sudo

# Set LXDE session
RUN echo "startlxde" > /home/user/.xsession && chown user:user /home/user/.xsession

# Disable animations (performance)
RUN mkdir -p /home/user/.config/lxsession/LXDE && \
    echo "[GTK]" > /home/user/.config/lxsession/LXDE/desktop.conf && \
    echo "sNet/ThemeName=Clearlooks" >> /home/user/.config/lxsession/LXDE/desktop.conf

# Expose RDP
EXPOSE 3389

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
