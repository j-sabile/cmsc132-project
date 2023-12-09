module xor_component (input wire [7:0] a, b, output wire [7:0] out);

  xor_gate xor0 (.a(a[0]), .b(b[0]), .out(out[0]));
  xor_gate xor1 (.a(a[1]), .b(b[1]), .out(out[1]));
  xor_gate xor2 (.a(a[2]), .b(b[2]), .out(out[2]));
  xor_gate xor3 (.a(a[3]), .b(b[3]), .out(out[3]));
  xor_gate xor4 (.a(a[4]), .b(b[4]), .out(out[4]));
  xor_gate xor5 (.a(a[5]), .b(b[5]), .out(out[5]));
  xor_gate xor6 (.a(a[6]), .b(b[6]), .out(out[6]));
  xor_gate xor7 (.a(a[7]), .b(b[7]), .out(out[7]));

endmodule