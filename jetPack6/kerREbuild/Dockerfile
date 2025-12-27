# syntax=docker/dockerfile:1
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

# Optional (kept): enable i386 for a few legacy packages
RUN dpkg --add-architecture i386

# Kernel build deps + basic tooling
RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      wget \
      git \
      xz-utils \
      bzip2 \
      build-essential \
      gcc \
      bc \
      vim \
      flex \
      bison \
      libfl-dev \
      pkg-config \
      perl \
      python3 \
      python-is-python3 \
      file \
      rsync \
      libssl-dev \
      libelf-dev \
      libncurses5-dev \
      device-tree-compiler \
      cpio \
      kmod \
      lzop \
      p7zip-full \
      p7zip-rar \
      qemu-user-static \
      \
      # Optional legacy/32-bit bits (remove if you don't need)
      libc6-i386 \
      lib32stdc++6 \
      zlib1g:i386 \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /out
CMD ["/bin/bash", "-l"]

