#!/bin/bash

# Start dbus
service dbus start

# Fix session
echo "startlxde" > /home/user/.xsession
chown user:user /home/user/.xsession

# Start XRDP
service xrdp start

# Keep container running
tail -f /dev/null
