# OxCaml Full DEV Image

A comprehensive Docker image for OxCaml development with all essential tools pre-installed.

## 🔥 What is OxCaml?

OxCaml is Jane Street's performance-focused extensions to the OCaml programming language, providing:

* **Fearless concurrency**: Type system additions to statically rule out data races
* **Memory layouts**: Control over data layout in memory with native SIMD support
* **Allocation control**: Tools to reduce GC pressure and improve cache efficiency
* **Quality of life improvements**: Polymorphic parameters, labeled tuples, immutable arrays, and more

## 🐳 This Docker Image

This is a comprehensive Docker image that provides the OxCaml compiler environment and all development tools specified in oxcaml.org. Perfect for:

* **Full development workflows** with all tools pre-configured
* **CI/CD pipelines** requiring complete OxCaml toolchain
* **Quick project setup** without manual tool installation
* **Consistent development environments** across teams

### What's Included

- **Base**: Ubuntu 25.04 (built on [opam-ubuntu](https://github.com/neuro-ng/opam-ubuntu) base image)
- **Compiler**: OxCaml 5.2.0+ox (based on OCaml 5.2.0) [oxcaml-switch-ubuntu](https://github.com/neuro-ng/oxcaml-switch-ubuntu)
- **Package Manager**: opam with ox repository configured
- **Development Tools**:
  - `dune` - Build system
  - `utop` - Enhanced interactive toplevel
  - `ocaml-lsp-server` - Language Server Protocol support
  - `merlin` - Editor integration
  - `ocamlformat` - Code formatter
- **Libraries**: `parallel`, `core_unix`
- **Build Tools**: `autoconf`, `pkg-config`, `gcc`, `build-essential`

## 🚀 Quick Start

### Pull and Run

```bash
# Pull the latest image
docker pull ghcr.io/neuro-ng/oxcaml-ubuntu:latest

# Run interactively
docker run -it --user ocaml-user --rm ghcr.io/neuro-ng/oxcaml-ubuntu:latest

# Mount your project directory
docker run -it --user ocaml-user --rm -v $(pwd):/workspace ghcr.io/neuro-ng/oxcaml-ubuntu:latest
```

### Basic Usage

```bash
# OxCaml environment is already activated
ocaml -version
# Should output: OCaml 5.2.0+ox

# Start the enhanced REPL
utop

# Create a simple project with dune (already installed)
mkdir my_oxcaml_project && cd my_oxcaml_project
dune init project hello_oxcaml
dune build
dune exec ./bin/main.exe

# Format your code (ocamlformat is pre-installed)
dune build @fmt
```

## 🔧 Use in GitHub Actions

Perfect for comprehensive CI/CD pipelines with full toolchain:

```yaml
name: Build OxCaml Project

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/neuro-ng/oxcaml-ubuntu:latest
      options: --user ocaml-user --workdir /workspace
    env:
      USER: ocaml-user
      HOME: /home/ocaml-user
      SHELL: /bin/bash
      PATH: /home/ocaml-user/.opam/5.2.0+ox/bin:/home/ocaml-user/.opam/5.2.0+ox/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
      OPAMROOT: /home/ocaml-user/.opam
      OPAMSWITCH: 5.2.0+ox
      OPAMYES: 1    
    steps:
      - uses: actions/checkout@v4
      
      - name: Verify OxCaml environment
        run: |
          ocaml -version
          dune --version
          utop --version
      
      - name: Install project dependencies
        run: |
          opam install . --deps-only -y
      
      - name: Build project
        run: dune build
      
      - name: Run tests
        run: dune runtest
      
      - name: Format check
        run: dune build @fmt
```

## 🏗️ Building Locally

```bash
# Clone this repository
git clone https://github.com/neuro-ng/oxcaml-switch-ubuntu.git
cd oxcaml-switch-ubuntu

# Build the Docker image
docker build -t oxcaml-ubuntu .

# Run your local build
docker run -it --user ocaml-user oxcaml-ubuntu
```

## 📚 OxCaml Resources

* **Official Website**: [oxcaml.org](https://oxcaml.org)
* **Installation Guide**: [oxcaml.org/get-oxcaml](https://oxcaml.org/get-oxcaml)
* **Documentation**: [oxcaml.org/documentation](https://oxcaml.org/documentation)
* **Source Code**: [github.com/oxcaml/oxcaml](https://github.com/oxcaml/oxcaml)

## 📄 License

This Docker configuration is provided under the MIT License. OxCaml itself is subject to its own licensing terms.

---

**Full OxCaml setup for efficient development! 🐪⚡** 