FROM dockurr/windows

# Fix storage
RUN mkdir -p /storage

# Install tiny web server
RUN apt update && apt install -y python3

# Force no KVM
ENV KVM=0

# Railway port
EXPOSE 8006

# CRITICAL FIX: keep-alive + Windows boot
CMD sh -c "python3 -m http.server $PORT & sleep 5 && /start.sh"
