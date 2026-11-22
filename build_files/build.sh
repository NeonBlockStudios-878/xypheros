#!/bin/bash

set -ouex pipefail

### 1. Rebrand OS Identity to XypherOS v1 Quantum Edge
sed -i 's/^NAME=.*/NAME="XypherOS"/' /usr/lib/os-release
sed -i 's/^PRETTY_NAME=.*/PRETTY_NAME="XypherOS v1 Quantum Edge"/' /usr/lib/os-release
sed -i 's/^ID=.*/ID=xypheros/' /usr/lib/os-release
sed -i 's/^DEFAULT_HOSTNAME=.*/DEFAULT_HOSTNAME="xypheros"/' /usr/lib/os-release
sed -i 's|^HOME_URL=.*|HOME_URL="https://github.com/NeonBlockStudios-878/xypheros"|' /usr/lib/os-release

### 2. Ensure Quantum Edge Light Mode Config Directory Exists
mkdir -p /etc/skel/.config
mkdir -p /usr/share/wallpapers/XypherOS/contents/images

### 3. Clean up temporary package caches
dnf5 clean all || true
