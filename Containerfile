ARG SOURCE_IMAGE="${SOURCE_IMAGE:-bazzite}"
ARG SOURCE_ORG="${SOURCE_ORG:-ublue-os}"
ARG TAG_VERSION="${TAG_VERSION:-stable}"

FROM ghcr.io/${SOURCE_ORG}/${SOURCE_IMAGE}:${TAG_VERSION}

# Copy custom XypherOS system files (Light Mode themes, wallpapers, apps)
COPY system_files/ /

# Run the XypherOS build and branding script
RUN --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/tmp \
    --mount=type=bind,from=ghcr.io/ublue-os/akmods:main-41,src=/rpms,dst=/tmp/akmods-rpms \
    --mount=type=bind,src=build_files,dst=/ctx \
    /ctx/build.sh
