#!/usr/bin/env bash
set -euo pipefail

git config --local core.hooksPath .githooks
echo "Local Git hooks enabled from .githooks"
