
FROM ubuntu:14.04
MAINTAINER Primordus https://github.com/Primordus/docker-ubuntu-cxx-dev


# Set Locale otherwise some applications may behave strangely when
# the encoding looks like ANSI_X3.4-1968
RUN locale-gen en_GB.UTF-8
ENV LANG=en_GB.UTF8 \
    LANGUAGE=en_GB:en \
    LC_ALL=en_GB.UTF-8

RUN apt-get update
RUN apt-get install -y software-properties-common && add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get -y install wget
RUN wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key add - && \
    echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.6 main" >> /etc/apt/sources.list.d/llvm.list && \
    echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.7 main" >> /etc/apt/sources.list.d/llvm.list && \
    echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.8 main" >> /etc/apt/sources.list.d/llvm.list
RUN apt-get update
RUN apt-get -y install \
    clang-3.6 \
    clang-3.7 \
    clang-3.8 \
    gcc-4.9 \
    g++-4.9 \
    gcc-5 \
    g++-5 \
    gcc-6 \
    g++-6 \
    cmake

EXPOSE 12345

