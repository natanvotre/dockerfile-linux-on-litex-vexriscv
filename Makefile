all: litex-essential riscv-gcc

riscv-gcc:
	mkdir riscv-gcc && cd riscv-gcc && \
	wget https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14.tar.gz \
		&& tar -xvf riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14.tar.gz \
		&& rm riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14.tar.gz

litex-essential:
	mkdir litex-essential && cd litex-essential && \
	wget https://raw.githubusercontent.com/enjoy-digital/litex/master/litex_setup.py \
		&& chmod +x litex_setup.py \
		&& ./litex_setup.py init

install:
	docker build -t linux-on-litex-vexriscv-3.6:latest .
