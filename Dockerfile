ARG MINIFORGE_VERSION=22.9.0-2
ARG UBUNTU_VERSION=20.04

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

LABEL maintainer="Tim Sanders <TSanders@mednet.ucla.edu>"