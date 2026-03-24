FROM dockurr/windows

# Required storage fix
RUN mkdir -p /storage

# IMPORTANT (no over config)
ENV KVM=0
ENV RAM_SIZE=1G
ENV CPU_CORES=1
ENV DISK_SIZE=8G
ENV PORT=8006

EXPOSE 8006
