# Use Ubuntu-based opam image as base
FROM ghcr.io/neuro-ng/oxcaml-ubuntu:latest

# Switch to root to install system dependencies
USER root

# Install Docker CLI and dependencies
RUN apt-get update && \
    apt-get install -y ca-certificates curl gnupg sudo && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo \
      "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" | \
      tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce-cli docker-buildx-plugin docker-compose-plugin && \
    groupadd -f docker && \
    usermod -aG docker ocaml-user && \
    echo "ocaml-user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ocaml-user && \
    chmod 0440 /etc/sudoers.d/ocaml-user && \
    rm -rf /var/lib/apt/lists/*

# Set default working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"] 
