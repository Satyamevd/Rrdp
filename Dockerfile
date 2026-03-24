FROM dockurr/windows

# storage fix
RUN mkdir -p /storage

# install ultra-light http server
RUN apt update && apt install -y busybox

ENV KVM=0

EXPOSE 8006

# CRITICAL: keep Railway alive + keep original startup
ENTRYPOINT ["/usr/bin/tini","--"]

CMD sh -c "busybox httpd -f -p $PORT & exec /start.sh"
