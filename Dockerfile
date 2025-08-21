# Use Ubuntu-based opam image as base
FROM ghcr.io/neuro-ng/oxcaml-ubuntu:latest

# Switch to ocaml-user
USER ocaml-user
WORKDIR /home/ocaml-user

# Update opam and create OxCaml switch with ox repository
RUN eval $(opam env --switch 5.2.0+ox) && \
    opam install -y ocamlformat merlin ocaml-lsp-server utop parallel core_unix && \
    opam clean

RUN eval $(opam env --switch 5.2.0+ox) && \
    opam install -y alcotest cohttp-lwt-unix uri_parsing magic-mime opam-dune-lint opium && \
    opam clean

RUN eval $(opam env --switch 5.2.0+ox) && \
    opam install -y jose mirage-crypto mirage-crypto-pk mirage-crypto-rng && \
    opam clean

# Set default working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"] 