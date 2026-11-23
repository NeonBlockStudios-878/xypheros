#!/bin/bash

set -ouex pipefail

### 1. Rebrand OS Identity to XypherOS v1 Quantum Edge
sed -i 's/^NAME=.*/NAME="XypherOS"/' /usr/lib/os-release
sed -i 's/^PRETTY_NAME=.*/PRETTY_NAME="XypherOS v1 Quantum Edge"/' /usr/lib/os-release
sed -i 's/^ID=.*/ID=xypheros/' /usr/lib/os-release
sed -i 's/^DEFAULT_HOSTNAME=.*/DEFAULT_HOSTNAME="xypheros"/' /usr/lib/os-release
sed -i 's|^HOME_URL=.*|HOME_URL="https://github.com/NeonBlockStudios-878/xypheros"|' /usr/lib/os-release
sed -i 's|^DOCUMENTATION_URL=.*|DOCUMENTATION_URL="https://github.com/NeonBlockStudios-878/xypheros"|' /usr/lib/os-release
sed -i 's|^SUPPORT_URL=.*|SUPPORT_URL="https://github.com/NeonBlockStudios-878/xypheros/issues"|' /usr/lib/os-release
sed -i 's|^BUG_REPORT_URL=.*|BUG_REPORT_URL="https://github.com/NeonBlockStudios-878/xypheros/issues"|' /usr/lib/os-release

### 2. Enforce Correct Permissions on System Configs & Wallpapers
chmod -R 755 /usr/share/wallpapers/XypherOS || true
chmod 644 /usr/share/wallpapers/XypherOS/metadata.json || true
chmod 644 /usr/share/wallpapers/XypherOS/contents/images/* || true

mkdir -p /etc/skel/.config
chmod 755 /etc/skel/.config
chmod 644 /etc/skel/.config/kdeglobals || true
chmod 644 /etc/skel/.config/plasmarc || true

### 3. Clean Caches & Temporary Files to Keep Image & ISO Lean
dnf5 clean all || true
rm -rf /tmp/* /var/tmp/* /var/cache/dnf/*
