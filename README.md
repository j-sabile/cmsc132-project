# CMSC132 Project

This project involves implementing a Verilog hardware description language. The goal is to create a single-cycle, fixed-opcode Verilog implementation that can process an 18-bit input. The input consists of two most significant bits (MSB) representing the opcode, and two eight-bit operands. The output is an eight-bit value.

## How To Use

To edit the test cases, edit the `testbench.v` file.

```
  iverilog -o maindesign xor_gate.v xor_gate_8bit.v or_gate.v and_gate.v nand_gate.v nand_gate_8bit.v full_adder.v full_adder_8bit.v main_design.v testbench.v
  vvp main_design
```

