# Use Ubuntu-based opam image as base
FROM ghcr.io/neuro-ng/oxcaml-ubuntu:latest

# Switch to ocaml-user
USER ocaml-user
WORKDIR /home/ocaml-user

RUN eval $(opam env --switch 5.2.0+ox) && \
    opam install -y  base64 digestif expect_test_helpers_async  && \
    opam clean

# Set default working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"] 
