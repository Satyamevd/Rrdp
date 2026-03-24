FROM dockurr/windows

# storage fix
RUN mkdir -p /storage

# lightweight http server
RUN apt update && apt install -y busybox

ENV KVM=0

EXPOSE 8006

ENTRYPOINT ["/usr/bin/tini","--"]

CMD sh -c "busybox httpd -f -p $PORT & exec /usr/local/bin/start.sh"
