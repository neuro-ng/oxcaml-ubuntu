# Use Ubuntu-based opam image as base
FROM ghcr.io/neuro-ng/oxcaml-ubuntu:sha-067091e

# Switch to root to install system dependencies
USER root

# Create a shim to run docker with sudo automatically
# This fixes "permission denied" errors when the socket is mounted with root permissions
# but the user is running as ocaml-user
RUN echo '#!/bin/bash\nsudo /usr/bin/docker "$@"' > /usr/local/bin/docker && \
    chmod +x /usr/local/bin/docker
# Set default working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"] 
