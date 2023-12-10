module full_subtracter (input wire a, b, bin, output wire d, bout);

  wire xor1_out, not1_out, not2_out, and1_out, and2_out;

  xor_gate xor1 (.a(a), .b(b), .out(xor1_out));
  xor_gate xor2 (.a(xor1_out), .b(bin), .out(d));
  not_gate not1 (.a(a), .out(not1_out));
  not_gate not2 (.a(xor1_out), .out(not2_out));
  and_gate and1 (.a(not1_out), .b(b), .out(and1_out));
  and_gate and2 (.a(bin), .b(not2_out), .out(and2_out));
  or_gate or1 (.a(and2_out), .b(and1_out), .out(bout));

endmodule
