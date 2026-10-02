#!/bin/sh
# Installe la version de Typst épinglée dans .typst-version (image Alpine, CI uniquement).
set -eu
version="$(cat .typst-version)"
apk add --no-cache curl xz >/dev/null
curl -fsSL "https://github.com/typst/typst/releases/download/v${version}/typst-x86_64-unknown-linux-musl.tar.xz" \
  | tar -xJ -C /usr/local/bin --strip-components=1 typst-x86_64-unknown-linux-musl/typst
typst --version
