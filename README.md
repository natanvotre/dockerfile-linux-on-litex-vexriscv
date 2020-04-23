# Dockerfile to Run linux-litex-vexriscv

## Set up the machine

- Clone this repository with all submodules:

```bash
$ git clone --recurse-submodules --remote-submodules github.com:natanvotre/dockerfile-linux-on-litex-vexriscv.git
```

- Run the make command in order to install the `litex-essential` and the `riscv-toolchain`

```bash
$ make
```

- Run make install command in order to build the docker image

```bash
$ make install
```

## Run the docker image

```bash
$ docker run -ti linux-on-litex-vexriscv-3.6 /bin/bash
```

## Run the simulation

Inside the docker image, run the `sim.py`

```bash
# ./sim.py
```

I might take some time, but will run the simulation fo the linux on riscv
