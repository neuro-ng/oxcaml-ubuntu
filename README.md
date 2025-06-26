# OxCaml Full DEV Image

Docker image for OxCaml development

## 🔥 What is OxCaml?

OxCaml is Jane Street's performance-focused extensions to the OCaml programming language, providing:

* **Fearless concurrency**: Type system additions to statically rule out data races
* **Memory layouts**: Control over data layout in memory with native SIMD support
* **Allocation control**: Tools to reduce GC pressure and improve cache efficiency
* **Quality of life improvements**: Polymorphic parameters, labeled tuples, immutable arrays, and more

## 🐳 This Docker Image

This is a minimal Docker image that provides just the OxCaml compiler environment without additional development tools. Perfect for:

* **CI/CD pipelines** that need a lightweight OxCaml environment
* **Base images** for building your own OxCaml development containers
* **Quick testing** of OxCaml code

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
# Once inside the container, activate the OxCaml environment
eval $(opam env --switch 5.2.0+ox)

# Verify OxCaml is working
ocaml -version
# Should output: OCaml 5.2.0+ox

# Install additional tools as needed
opam install dune utop

# Create and build a simple project
echo 'let () = print_endline "Hello OxCaml!"' > hello.ml
ocamlopt -o hello hello.ml
./hello
```

## 🔧 Use in GitHub Actions

Perfect for lightweight CI/CD pipelines:

```yaml
name: Build OxCaml Project

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/neuro-ng/oxcaml-switch-ubuntu:latest
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup OxCaml environment
        run: eval $(opam env --switch 5.2.0+ox)
      
      - name: Install build tools
        run: |
          eval $(opam env --switch 5.2.0+ox)
          opam install dune -y
      
      - name: Build project
        run: |
          eval $(opam env --switch 5.2.0+ox)
          dune build
```

## 🏗️ Building Locally

```bash
# Clone this repository
git clone https://github.com/neuro-ng/oxcaml-switch-ubuntu.git
cd oxcaml-switch-ubuntu

# Build the Docker image
docker build -t oxcaml-switch-ubuntu .

# Run your local build
docker run -it oxcaml-switch-ubuntu
```

## 📚 OxCaml Resources

* **Official Website**: [oxcaml.org](https://oxcaml.org)
* **Installation Guide**: [oxcaml.org/get-oxcaml](https://oxcaml.org/get-oxcaml)
* **Documentation**: [oxcaml.org/documentation](https://oxcaml.org/documentation)
* **Source Code**: [github.com/oxcaml/oxcaml](https://github.com/oxcaml/oxcaml)

## 📄 License

This Docker configuration is provided under the MIT License. OxCaml itself is subject to its own licensing terms.

---

**Minimal OxCaml setup for efficient development! 🐪⚡** 