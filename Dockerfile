# Use Ubuntu-based opam image as base
FROM ghcr.io/neuro-ng/oxcaml-switch-ubuntu:20250626

# Switch to ocaml-user
USER ocaml-user
WORKDIR /home/ocaml-user

# Update opam and create OxCaml switch with ox repository
RUN eval $(opam env --switch 5.2.0+ox) && \
    opam install -y ocamlformat merlin utop parallel

# Set default working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"] 