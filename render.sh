#!/usr/bin/env bash
set -e
echo "==> Rendering carrier-throttling..."
quarto render
echo "==> Done. Output in docs/"
