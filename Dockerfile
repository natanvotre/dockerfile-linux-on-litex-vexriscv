from ubuntu:18.04

# update apt
RUN apt upgrade \
    && apt update

# install python3.7
RUN apt install -y software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt install -y \
        python3.7 \
        python3-dev \
        libyaml-dev \
        libpython3.7-dev \
        python3-numpy \
        python3-pip \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2 \
    && pip3 install pyyaml

# preriquisites for litex-vexriscv
RUN apt install -y build-essential \
    device-tree-compiler \
    wget git \
    python3-setuptools

# clone linux-on-litex-vexriscv repo
WORKDIR /home/vexriscv
RUN git clone https://github.com/enjoy-digital/linux-on-litex-vexriscv \
    && git clone https://github.com/enjoy-digital/linux-on-litex-vexriscv-prebuilt \
    && cp -r linux-on-litex-vexriscv-prebuilt/* linux-on-litex-vexriscv \
    && rm -rf linux-on-litex-vexriscv-prebuilt

# install litex packages
WORKDIR /home/essential
RUN wget https://raw.githubusercontent.com/enjoy-digital/litex/master/litex_setup.py \
    && chmod +x litex_setup.py \
    && ./litex_setup.py init \
    && ./litex_setup.py install

# install litex packages
WORKDIR /home
RUN wget https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14.tar.gz \
    && tar -xvf riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14.tar.gz \
    && echo 'export PATH=$PATH:$PWD/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/bin/' >> ~/.bashrc

# install verilator
RUN apt install -y \
    verilator \
    libevent-dev \
    libjson-c-dev
