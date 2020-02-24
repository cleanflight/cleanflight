This file will explain how to setup Freedom E SDK, build app and flash target all via CLI.

For more info see https://github.com/sifive/freedom-e-sdk

--- Prerequisites --- 
-GNU Make
-Git
-RISC-V GNU Toolchain
-RISC-V QEMU (for use with the qemu-sifive-* simulation targets)
-RISC-V OpenOCD (for use with development board and FPGA targets)
-Segger J-LINK (for use with certain development boards) ***used to communicate with JTAG to flash board but not required to just compile app

all RISC-V tools can be found here https://www.sifive.com/boards

--- Install the RISC-V Toolchain and OpenOCD --- 

For OpenOCD and/or RISC-V GNU Toolchain, download the .tar.gz for your platform, and unpack it to your desired location. Then, use the RISCV_PATH and RISCV_OPENOCD_PATH variables when using the tools:

cp openocd-<date>-<platform>.tar.gz /my/desired/location/
cp riscv64-unknown-elf-gcc-<date>-<platform>.tar.gz /my/desired/location
cd /my/desired/location
tar -xvf openocd-<date>-<platform>.tar.gz
tar -xvf riscv64-unknown-elf-gcc-<date>-<platform>.tar.gz
export RISCV_OPENOCD_PATH=/my/desired/location/openocd
export RISCV_PATH=/my/desired/location/riscv64-unknown-elf-gcc-<date>-<version>

*Don't forget to update system variables RISCV_OPENOCD and RISCV_PATH


--- Install RISC-V QEMU --- 

Download the .tar.gz for your platform and unpack it to your desired location. Then, add QEMU to your path:


cp riscv-qemu-<version>-<date>-<platform>.tar.gz /my/desired/location
tar -xvf riscv-qemu-<version>-<date>-<platform>.tar.gz
export PATH=$PATH:/my/desired/location/riscv-qemu-<version>-<date>-<platform>/bin

*Don't forget to update system variables PATH

--- Clone repo --- 

git clone --recursive https://github.com/sifive/freedom-e-sdk.git
cd freedom-e-sdk


--- Building example app --- 

In the example below - we'll assume the target is HiFive1 Revb

make [PROGRAM=hello] [TARGET=sifive-hifive1-revb] [CONFIGURATION=release] software


--- Upload to target --- 

make [PROGRAM=hello] [TARGET=sifive-hifive1-revb] [CONFIGURATION=release] upload


--- Output files after building app --- 

/<sample app name>/bsp
Is the directory where the files specific to the target board that the SDK will communicate with.



--- Issues --- 

- If the make process stops and complains that it can find OpenOCD or gcc, then add system variables and try again