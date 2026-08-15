ARG BUILD_FLAVOR="${BUILD_FLAVOR:-}"

FROM scratch AS ctx

COPY build_files /build
COPY system_files /files
COPY cosign.pub /files/etc/pki/containers/zirconium.pub

FROM quay.io/fedora/fedora-bootc:46@sha256:b5c4f06bb53444f3befa085d0e8c1fe6ac7333e56f96fb9d5a3a97f622725170
ARG BUILD_FLAVOR="${BUILD_FLAVOR:-}"

RUN exit 0

# RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
#     --mount=type=tmpfs,dst=/var \
#     --mount=type=tmpfs,dst=/tmp \
#     /ctx/build/00-base.sh

# RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
#     --mount=type=tmpfs,dst=/var \
#     --mount=type=tmpfs,dst=/tmp \
#     /ctx/build/01-theme.sh

# RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
#     --mount=type=tmpfs,dst=/var \
#     --mount=type=tmpfs,dst=/tmp \
#     /ctx/build/02-extras.sh

# RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
#     /ctx/build/03-nvidia.sh

# RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
#     --mount=type=tmpfs,dst=/var \
#     --mount=type=tmpfs,dst=/tmp \
#     /ctx/build/99-cleanup.sh

# # This is handy for VM testing
# # RUN usermod -p "$(echo "changeme" | mkpasswd -s)" root

# RUN rm -rf /var/* && bootc container lint
