module nand_component (input wire [7:0] a, b, output wire [7:0] out);
  nand_gate nand0 (.a(a[0]), .b(b[0]), .out(out[0]));
  nand_gate nand1 (.a(a[1]), .b(b[1]), .out(out[1]));
  nand_gate nand2 (.a(a[2]), .b(b[2]), .out(out[2]));
  nand_gate nand3 (.a(a[3]), .b(b[3]), .out(out[3]));
  nand_gate nand4 (.a(a[4]), .b(b[4]), .out(out[4]));
  nand_gate nand5 (.a(a[5]), .b(b[5]), .out(out[5]));
  nand_gate nand6 (.a(a[6]), .b(b[6]), .out(out[6]));
  nand_gate nand7 (.a(a[7]), .b(b[7]), .out(out[7]));
endmodule