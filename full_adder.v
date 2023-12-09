module full_adder(input wire a, b, cin, output wire s, cout);

  wire xor1_out, xor2_out, and1_out, and2_out, or1_out;

  xor_gate xor1 (.a(a), .b(b), .out(xor1_out));
  xor_gate xor2 (.a(xor1_out), .b(cin), .out(xor2_out));
  and_gate nand1 (.a(cin), .b(xor1_out), .out(and1_out));
  and_gate nand2 (.a(a), .b(b), .out(and2_out));
  or_gate nand3 (.a(and1_out), .b(and2_out), .out(or1_out));

  assign s = xor2_out;
  assign cout = or1_out;

endmodule
