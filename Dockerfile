ARG MINIFORGE_VERSION=23.3.1-1
ARG UBUNTU_VERSION=23.04

FROM condaforge/mambaforge:${MINIFORGE_VERSION} AS builder

# Use conda to install tools and dependencies into /usr/local
ARG RTGTOOLS_VERSION=3.12.1
RUN conda create -qy -p /usr/local \
    -c bioconda \
    -c conda-forge \
    rtg-tools==${RTGTOOLS_VERSION}

# Deploy the target tools into a base image
FROM ubuntu:${UBUNTU_VERSION} AS final
COPY --from=builder /usr/local /usr/local

# Add a new user/group called bldocker
RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

# Change the default user to bldocker from root
USER bldocker

LABEL maintainer="John Sahrmann <jsahrmann@mednet.ucla.edu>" \
      org.opencontainers.image.source=https://github.com/uclahs-cds/docker-RTGtools
