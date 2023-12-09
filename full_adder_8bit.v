module full_adder_component (input wire [7:0] a, b, output wire [7:0] out);

  wire fa1_cout, fa2_cout, fa3_cout, fa4_cout, fa5_cout, fa6_cout, fa7_cout, fa8_cout;

  full_adder fa8 (.a(a[0]), .b(b[0]), .cin(0), .s(out[0]), .cout(fa7_cout));
  full_adder fa7 (.a(a[1]), .b(b[1]), .cin(fa7_cout), .s(out[1]), .cout(fa6_cout));
  full_adder fa6 (.a(a[2]), .b(b[2]), .cin(fa6_cout), .s(out[2]), .cout(fa5_cout));
  full_adder fa5 (.a(a[3]), .b(b[3]), .cin(fa5_cout), .s(out[3]), .cout(fa4_cout));
  full_adder fa4 (.a(a[4]), .b(b[4]), .cin(fa4_cout), .s(out[4]), .cout(fa3_cout));
  full_adder fa3 (.a(a[5]), .b(b[5]), .cin(fa3_cout), .s(out[5]), .cout(fa2_cout));
  full_adder fa2 (.a(a[6]), .b(b[6]), .cin(fa2_cout), .s(out[6]), .cout(fa1_cout));
  full_adder fa1 (.a(a[7]), .b(b[7]), .cin(fa1_cout), .s(out[7]), .cout(fa8_cout));

endmodule   