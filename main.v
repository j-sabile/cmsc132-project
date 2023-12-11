// DECODER COMPONENT
// - splits the 18bit input into opcode-operand-operand
module decoder(input wire [17:0] in, output wire [1:0] opcode, output wire [7:0] a, output wire [7:0] b);
  assign opcode = in[17:16];
  assign a = in[15:8];
  assign b = in[7:0];
endmodule

// MAIN DESIGN
// - accepts an 18bit input and
// - outputs an 8bit output
module main_design (input wire [17:0] in, output reg [7:0] out);

  // temp output of decoder
  wire [1:0] opcode;
  wire [7:0] a;
  wire [7:0] b;

  // temp outputs of components
  wire [7:0] temp_out_adder;
  wire [7:0] temp_out_xor;
  wire [7:0] temp_out_nand;
  wire [7:0] temp_out_function;

  // decoder
  decoder dec1 (.in(in), .opcode(opcode), .a(a), .b(b));

  // components
  full_adder_component adder_comp(.a(a), .b(b), .out(temp_out_adder));
  xor_component xor_comp(.a(a), .b(b), .out(temp_out_xor));
  nand_component nand_comp(.a(a), .b(b), .out(temp_out_nand));
  function_component function_comp(.a(a), .b(b), .out(temp_out_function));

  always @(*) begin
    case (opcode)
      2'b00: out = temp_out_adder;      // if opcode is "00", use the full_adder_component
      2'b01: out = temp_out_xor;        // if opcode is "01", use the xor_component
      2'b10: out = temp_out_nand;       // if opcode is "10", use the nand_component
      default: out = temp_out_function; // else, use the output of function_component
    endcase
  end
endmodule


// AND GATE
module and_gate(input wire a, b, output wire out);
  assign out = a & b;
endmodule

// OR GATE
module or_gate(input wire a, b, output wire out);
  assign out = a | b;
endmodule

// XOR GATE
module xor_gate(input wire a, b, output wire out);
  assign out = a ^ b;
endmodule

// NOT GATE
module not_gate(input wire a, output wire out);
  assign out = ~a;
endmodule

// NAND GATE
module nand_gate(input wire a, b, output wire out);
  assign out = ~(a & b);
endmodule


// XOR COMPONENT
// - accepts 2 8bit input
// - outputs an 8bit result of XOR operation 
module xor_component (input wire [7:0] a, b, output wire [7:0] out);

  // XOR operations
  xor_gate xor0 (.a(a[0]), .b(b[0]), .out(out[0]));
  xor_gate xor1 (.a(a[1]), .b(b[1]), .out(out[1]));
  xor_gate xor2 (.a(a[2]), .b(b[2]), .out(out[2]));
  xor_gate xor3 (.a(a[3]), .b(b[3]), .out(out[3]));
  xor_gate xor4 (.a(a[4]), .b(b[4]), .out(out[4]));
  xor_gate xor5 (.a(a[5]), .b(b[5]), .out(out[5]));
  xor_gate xor6 (.a(a[6]), .b(b[6]), .out(out[6]));
  xor_gate xor7 (.a(a[7]), .b(b[7]), .out(out[7]));
endmodule


// NAND COMPONENT
// - accepts 2 8bit input
// - outputs an 8bit result of NAND operation 
module nand_component (input wire [7:0] a, b, output wire [7:0] out);

  // NAND operations
  nand_gate nand0 (.a(a[0]), .b(b[0]), .out(out[0]));
  nand_gate nand1 (.a(a[1]), .b(b[1]), .out(out[1]));
  nand_gate nand2 (.a(a[2]), .b(b[2]), .out(out[2]));
  nand_gate nand3 (.a(a[3]), .b(b[3]), .out(out[3]));
  nand_gate nand4 (.a(a[4]), .b(b[4]), .out(out[4]));
  nand_gate nand5 (.a(a[5]), .b(b[5]), .out(out[5]));
  nand_gate nand6 (.a(a[6]), .b(b[6]), .out(out[6]));
  nand_gate nand7 (.a(a[7]), .b(b[7]), .out(out[7]));
endmodule


// FULL ADDER
// - accepts a, b, and carry-in
// - outputs sum and carry-out
module full_adder(input wire a, b, cin, output wire s, cout);

  // temp outputs of logic gates
  wire xor1_out, xor2_out, and1_out, and2_out, or1_out;

  // logic gates
  xor_gate xor1 (.a(a), .b(b), .out(xor1_out));
  xor_gate xor2 (.a(xor1_out), .b(cin), .out(s));
  and_gate nand1 (.a(cin), .b(xor1_out), .out(and1_out));
  and_gate nand2 (.a(a), .b(b), .out(and2_out));
  or_gate nand3 (.a(and1_out), .b(and2_out), .out(cout));
endmodule


// FULL ADDER COMPONENT (8bits)
// - accepts 2 8bit inputs/addends
// - outputs the 8bit sum
module full_adder_component (input wire [7:0] a, b, output wire [7:0] out);

  // temp cout of full adders
  wire fa1_cout, fa2_cout, fa3_cout, fa4_cout, fa5_cout, fa6_cout, fa7_cout, fa8_cout;

  // logic gates
  full_adder fa8 (.a(a[0]), .b(b[0]), .cin(0), .s(out[0]), .cout(fa8_cout));
  full_adder fa7 (.a(a[1]), .b(b[1]), .cin(fa8_cout), .s(out[1]), .cout(fa7_cout));
  full_adder fa6 (.a(a[2]), .b(b[2]), .cin(fa7_cout), .s(out[2]), .cout(fa6_cout));
  full_adder fa5 (.a(a[3]), .b(b[3]), .cin(fa6_cout), .s(out[3]), .cout(fa5_cout));
  full_adder fa4 (.a(a[4]), .b(b[4]), .cin(fa5_cout), .s(out[4]), .cout(fa4_cout));
  full_adder fa3 (.a(a[5]), .b(b[5]), .cin(fa4_cout), .s(out[5]), .cout(fa3_cout));
  full_adder fa2 (.a(a[6]), .b(b[6]), .cin(fa3_cout), .s(out[6]), .cout(fa2_cout));
  full_adder fa1 (.a(a[7]), .b(b[7]), .cin(fa2_cout), .s(out[7]), .cout(fa1_cout));
endmodule

// FULL SUBTRACTER
// - accepts a, b, and borrow-in
// - outputs difference and borrow-out
module full_subtracter (input wire a, b, bin, output wire d, bout);

  // temp outputs of logic gates
  wire xor1_out, not1_out, not2_out, and1_out, and2_out;

  // logic gates
  xor_gate xor1 (.a(a), .b(b), .out(xor1_out));
  xor_gate xor2 (.a(xor1_out), .b(bin), .out(d));
  not_gate not1 (.a(a), .out(not1_out));
  not_gate not2 (.a(xor1_out), .out(not2_out));
  and_gate and1 (.a(not1_out), .b(b), .out(and1_out));
  and_gate and2 (.a(bin), .b(not2_out), .out(and2_out));
  or_gate or1 (.a(and2_out), .b(and1_out), .out(bout));
endmodule


// FUNCTION COMPONENT
// - accepts 2 8bit input
// - outputs the 8bit result
// O = OR(A, B) - B 
module function_component(input wire [7:0] a, b, output wire [7:0] out);

  // temp outputs of logic gates
  wire or1_out, or2_out, or3_out, or4_out, or5_out, or6_out, or7_out, or8_out;
  wire fs1_bout, fs2_bout, fs3_bout, fs4_bout, fs5_bout, fs6_bout, fs7_bout, fs8_bout;

  // or gates
  or_gate or1 (.a(a[0]), .b(b[0]), .out(or1_out));
  or_gate or2 (.a(a[1]), .b(b[1]), .out(or2_out));
  or_gate or3 (.a(a[2]), .b(b[2]), .out(or3_out));
  or_gate or4 (.a(a[3]), .b(b[3]), .out(or4_out));
  or_gate or5 (.a(a[4]), .b(b[4]), .out(or5_out));
  or_gate or6 (.a(a[5]), .b(b[5]), .out(or6_out));
  or_gate or7 (.a(a[6]), .b(b[6]), .out(or7_out));
  or_gate or8 (.a(a[7]), .b(b[7]), .out(or8_out));

  // full subtracters
  full_subtracter fs8 (.a(or1_out), .b(b[0]), .bin(0), .d(out[0]), .bout(fs7_bout));
  full_subtracter fs7 (.a(or2_out), .b(b[1]), .bin(fs7_bout), .d(out[1]), .bout(fs6_bout));
  full_subtracter fs6 (.a(or3_out), .b(b[2]), .bin(fs6_bout), .d(out[2]), .bout(fs5_bout));
  full_subtracter fs5 (.a(or4_out), .b(b[3]), .bin(fs5_bout), .d(out[3]), .bout(fs4_bout));
  full_subtracter fs4 (.a(or5_out), .b(b[4]), .bin(fs4_bout), .d(out[4]), .bout(fs3_bout));
  full_subtracter fs3 (.a(or6_out), .b(b[5]), .bin(fs3_bout), .d(out[5]), .bout(fs2_bout));
  full_subtracter fs2 (.a(or7_out), .b(b[6]), .bin(fs2_bout), .d(out[6]), .bout(fs1_bout));
  full_subtracter fs1 (.a(or8_out), .b(b[7]), .bin(fs1_bout), .d(out[7]), .bout(fs8_bout));
endmodule


// TESTBENCH
module main_design_tb;

  reg [17:0] in;    // input
  wire [7:0] out;   // output

  main_design dut (.in(in), .out(out));

  initial begin

    // Test case 1
    in = 18'b001000001000011111;
    # 5 $display("Test case 1: in = %b, out = %b", in, out);

    // Test case 2
    in = {2'b01, 8'b00000001, 8'b00000000};
    #5 $display("Test case 2: in = %b, out = %b", in, out);

    // Test case 3
    in = {2'b10, 8'b10101010, 8'b01010101};
    #5 $display("Test case 3: in = %b, out = %b", in, out);

    // Test case 4
    in = {2'b11, 8'b00011111, 8'b00010001};
    #5 $display("Test case 4: in = %b, out = %b", in, out);

    $finish;
  end

endmodule


     
// REFERENCES

// Verilog Basics Simple Things Coding Examples - Bucknell University. (2015). 
//   https://www.eg.bucknell.edu/~csci320/2016-fall/wp-content/uploads/2015/08/vimia111_verilog_alapok.pdf 