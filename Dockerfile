FROM ubuntu:14.04
MAINTAINER Dan Liew <daniel.liew@imperial.ac.uk>
ENV LLVM_VERSION=3.7
ENV CONTAINER_USER="cxxdev"

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget
RUN wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|sudo apt-key add - && \
	echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-${LLVM_VERSION} main" >> /etc/apt/sources.list.d/llvm.list && \
	apt-get update

RUN apt-get -y --no-install-recommends install \
  aptitude \
  build-essential \
  clang-${LLVM_VERSION} \
  cmake \
  cmake-curses-gui \
  coreutils \
  gcc \
  g++ \
  gdb \
  git-core \
  htop \
  mercurial \
  ncdu \
  ninja-build \
  python \
  python-dev \
  python-pip \
  subversion \
  tmux \
  tree \
  unzip \
  vim


# Add non-root user for container but give it sudo access.
# Password is the same as the username
RUN useradd -m ${CONTAINER_USER} && \
    echo ${CONTAINER_USER}:${CONTAINER_USER} | chpasswd && \
    cp /etc/sudoers /etc/sudoers.bak && \
    echo "${CONTAINER_USER}  ALL=(root) ALL" >> /etc/sudoers
USER ${CONTAINER_USER}
