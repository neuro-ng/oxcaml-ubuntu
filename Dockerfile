# Use Ubuntu-based opam image as base
FROM ghcr.io/neuro-ng/oxcaml-ubuntu:sha-ff86549

# Switch to ocaml-user
USER ocaml-user
WORKDIR /home/ocaml-user

# Update opam and create OxCaml switch with ox repository
RUN eval $(opam env --switch 5.2.0+ox) && \
    opam install -y utop parallel core_unix && \\
    opam clean

# Set default working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"] 