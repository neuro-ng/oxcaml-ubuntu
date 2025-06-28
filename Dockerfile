# Use Ubuntu-based opam image as base
FROM ghcr.io/neuro-ng/oxcaml-ubuntu:sha-8fa7b0b

# Switch to ocaml-user
USER ocaml-user
WORKDIR /home/ocaml-user

# Update opam and create OxCaml switch with ox repository
RUN eval $(opam env --switch 5.2.0+ox) && \
    opam install -y ocaml-lsp-server

# Set default working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"] 