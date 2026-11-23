ARG SOURCE_IMAGE="${SOURCE_IMAGE:-bazzite}"
ARG SOURCE_ORG="${SOURCE_ORG:-ublue-os}"
ARG TAG_VERSION="${TAG_VERSION:-stable}"

FROM ghcr.io/${SOURCE_ORG}/${SOURCE_IMAGE}:${TAG_VERSION}

# Metadata labels for GHCR and bootc image inspection
LABEL org.opencontainers.image.title="XypherOS v1 Quantum Edge"
LABEL org.opencontainers.image.description="Custom Fedora Atomic / Bazzite Gaming OS with Quantum Edge Light Mode"
LABEL org.opencontainers.image.source="https://github.com/NeonBlockStudios-878/xypheros"
LABEL containers.bootc="1"

# Copy Quantum Edge Light Mode configs, Plasma defaults, and wallpapers
COPY system_files/ /

# Execute XypherOS rebranding and system configuration script
RUN --mount=type=bind,src=build_files,dst=/ctx \
    /ctx/build.sh
