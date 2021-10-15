#!/bin/bash

set -e

if [[ ! -v AWS_PROFILE ]]; then
    echo "[-]ERROR: Values AWS_PROFILE not set, you should export its."
    exit 1
else
    echo "[+] OK!.. AWS_PROFILE is set to: ${AWS_PROFILE}"
fi