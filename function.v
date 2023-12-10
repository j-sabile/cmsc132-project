module function_component(input wire [7:0] a, b, output wire [7:0] out);

  wire or1_out, or2_out, or3_out, or4_out, or5_out, or6_out, or7_out, or8_out;
  wire fs1_bout, fs2_bout, fs3_bout, fs4_bout, fs5_bout, fs6_bout, fs7_bout, fs8_bout;

  or_gate or1 (.a(a[0]), .b(b[0]), .out(or1_out));
  or_gate or2 (.a(a[1]), .b(b[1]), .out(or2_out));
  or_gate or3 (.a(a[2]), .b(b[2]), .out(or3_out));
  or_gate or4 (.a(a[3]), .b(b[3]), .out(or4_out));
  or_gate or5 (.a(a[4]), .b(b[4]), .out(or5_out));
  or_gate or6 (.a(a[5]), .b(b[5]), .out(or6_out));
  or_gate or7 (.a(a[6]), .b(b[6]), .out(or7_out));
  or_gate or8 (.a(a[7]), .b(b[7]), .out(or8_out));

 full_subtracter fs8 (.a(or1_out), .b(b[0]), .bin(0), .d(out[0]), .bout(fs7_bout));
 full_subtracter fs7 (.a(or2_out), .b(b[1]), .bin(fs7_bout), .d(out[1]), .bout(fs6_bout));
 full_subtracter fs6 (.a(or3_out), .b(b[2]), .bin(fs6_bout), .d(out[2]), .bout(fs5_bout));
 full_subtracter fs5 (.a(or4_out), .b(b[3]), .bin(fs5_bout), .d(out[3]), .bout(fs4_bout));
 full_subtracter fs4 (.a(or5_out), .b(b[4]), .bin(fs4_bout), .d(out[4]), .bout(fs3_bout));
 full_subtracter fs3 (.a(or6_out), .b(b[5]), .bin(fs3_bout), .d(out[5]), .bout(fs2_bout));
 full_subtracter fs2 (.a(or7_out), .b(b[6]), .bin(fs2_bout), .d(out[6]), .bout(fs1_bout));
 full_subtracter fs1 (.a(or8_out), .b(b[7]), .bin(fs1_bout), .d(out[7]), .bout(fs8_bout));

endmodule
