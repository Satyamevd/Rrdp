FROM dockurr/windows

# Storage fix
RUN mkdir -p /storage

ENV KVM=0

EXPOSE 8006

# Keep Railway alive + start Windows
CMD sh -c "while true; do echo ok | nc -l -p $PORT; done & /start.sh"
