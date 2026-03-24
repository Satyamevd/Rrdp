FROM dockurr/windows

# Storage fix
RUN mkdir -p /storage

# Install busybox (lightweight http)
RUN apt update && apt install -y busybox

ENV KVM=0

EXPOSE 8006

# FIX: keep Railway alive + run Windows
ENTRYPOINT sh -c "busybox httpd -f -p $PORT & exec /usr/bin/tini -- /start.sh"
