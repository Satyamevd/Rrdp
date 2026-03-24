FROM dockurr/windows

# Create required storage folder
RUN mkdir -p /storage

ENV KVM=0
ENV RAM_SIZE=16G
ENV CPU_CORES=8
ENV DISK_SIZE=100G
ENV PORT=8006

EXPOSE 8006
