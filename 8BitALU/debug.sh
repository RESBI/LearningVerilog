iverilog -o alu-emulator Algorithms.v ALU.v testbench.v
./alu-emulator
gtkwave dump.vcd