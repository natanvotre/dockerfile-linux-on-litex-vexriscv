from ubuntu:18.04

# update apt
RUN apt upgrade \
    && apt update

# install python3.6
RUN apt install -y software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt install -y \
        python3.6 \
        python3-dev \
        libyaml-dev \
        libpython3.6-dev \
        python3-numpy \
        python3-pip \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2 \
    && pip3 install pyyaml

# preriquisites for litex-vexriscv
RUN apt install -y build-essential \
    device-tree-compiler \
    wget git \
    python3-setuptools

# clone linux-on-litex-vexriscv repo
WORKDIR /home/linux-on-litex-vexriscv
COPY linux-on-litex-vexriscv .

# install litex packages
WORKDIR /home/litex-essential
COPY litex-essential .
RUN ./litex_setup.py install

# Add riscv toolchain
WORKDIR /home/riscv-gcc
COPY riscv-gcc .
RUN echo 'export PATH=$PATH:/home/riscv-gcc/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/bin/' >> ~/.bashrc

# install verilator
RUN apt install -y \
    verilator \
    libevent-dev \
    libjson-c-dev
