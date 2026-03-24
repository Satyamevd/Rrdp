FROM dockurr/windows

RUN mkdir -p /storage

ENV KVM=0
ENV BOOT=fast

EXPOSE 8006
