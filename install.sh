#!/usr/bin/env bash
set -euo pipefail

# PhantomClaw one-command installer
# Usage: curl -fsSL https://raw.githubusercontent.com/PhantomGames52/phantomclaw-releases/main/install.sh | bash -s -- [version]
# Default version: v1.0.0-alpha

VERSION="${1:-v1.0.0-alpha}"
REPO="PhantomGames52/phantomclaw-releases"
ASSET="phantomclaw-${VERSION}.zip"
URL="https://github.com/${REPO}/releases/download/${VERSION}/${ASSET}"

# Install directory
INSTALL_DIR="${HOME}/.local/phantomclaw"
mkdir -p "$INSTALL_DIR"

echo "Downloading ${ASSET}..."
curl -fL "$URL" -o "/tmp/${ASSET}"

echo "Extracting to ${INSTALL_DIR}..."
unzip -o "/tmp/${ASSET}" -d "$INSTALL_DIR"
rm -f "/tmp/${ASSET}"

# Ensure CLI is executable
if [ -f "${INSTALL_DIR}/dist/index.js" ]; then
  chmod +x "${INSTALL_DIR}/dist/index.js"
else
  echo "Error: CLI not found at dist/index.js in the archive"
  exit 1
fi

# Symlink to bin
BIN_DIR="${HOME}/.local/bin"
mkdir -p "$BIN_DIR"
if [ ! -e "${BIN_DIR}/phantomclaw" ]; then
  ln -s "${INSTALL_DIR}/dist/index.js" "${BIN_DIR}/phantomclaw"
  echo "Linked phantomclaw to ${BIN_DIR}/phantomclaw"
else
  echo "phantomclaw already linked; updating..."
  ln -sf "${INSTALL_DIR}/dist/index.js" "${BIN_DIR}/phantomclaw"
fi

# Warn if not in PATH
if [[ ":$PATH:" != *":${BIN_DIR}:"* ]]; then
  echo "Note: ${BIN_DIR} is not in your PATH. Add it to ~/.bashrc or ~/.zshrc:"
  echo '  export PATH="$HOME/.local/bin:$PATH"'
fi

echo "PhantomClaw ${VERSION} installed. Run: phantomclaw --help"
