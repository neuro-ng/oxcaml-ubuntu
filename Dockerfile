# Use Ubuntu-based opam image as base
FROM ghcr.io/neuro-ng/oxcaml-ubuntu:sha-bf0b2d9

# Switch to ocaml-user
USER ocaml-user
WORKDIR /home/ocaml-user

# Update opam and create OxCaml switch with ox repository
RUN eval $(opam env --switch 5.2.0+ox) && \
    opam install -y ocamlformat merlin ocaml-lsp-server utop parallel core_unix && \
    opam clean

RUN eval $(opam env --switch 5.2.0+ox) && \
    opam install -y alcotest cohttp-lwt-unix && \
    opam clean

# Set permissions for the workspace directory
RUN chown -R ocaml-user:ocaml-user /workspace

# Set default working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"] 