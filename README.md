
## How To Use

To edit the test cases, edit the `testbench.v` file.

```
  iverilog -o maindesign xor_gate.v xor_gate_8bit.v or_gate.v and_gate.v nand_gate.v nand_gate_8bit.v full_adder.v full_adder_8bit.v main_design.v testbench.v
  vvp main_design
```

