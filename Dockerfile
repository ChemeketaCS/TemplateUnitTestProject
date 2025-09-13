# Only used when running in a codespace
# This file configures the software installed on the virtual machine
FROM docker.io/ubuntu:25.04

# RUN apt-get update && \
#     apt install -y software-properties-common && \
#     add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update && \
    apt-get install -yq \
    build-essential \
    g++-15 \
    gcc-15 \
    git \
    gdb \
    valgrind \
    vim

# Prefer g++-15
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-15 60 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-15 60

# Specify fake user/email so git will run
RUN git config --global user.name "A Student" && \
    git config --global user.email student@nowhere.edu
