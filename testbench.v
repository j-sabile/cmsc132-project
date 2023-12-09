module xor_component_tb;

  // Inputs
  reg [1:0] opcode;
  reg [7:0] a;
  reg [7:0] b;

  // Output
  wire [7:0] out;

  // Instantiate the design under test
  main_design dut (.opcode(opcode), .a(a), .b(b), .out(out));

  initial begin
  
    // Test case 1
    opcode = 2'b01;
    a = 8'b00000000;
    b = 8'b00000000;
    #5 $display("Test case 1: opcode = %b, a = %b, b = %b, out = %b", opcode, a, b, out);

    // Test case 2
    opcode = 2'b01;
    a = 8'b00000001;
    b = 8'b00000000;
    #5 $display("Test case 2: opcode = %b, a = %b, b = %b, out = %b", opcode, a, b, out);

    // Test case 3
    opcode = 2'b01;
    a = 8'b00000001;
    b = 8'b00000001;
    #5 $display("Test case 3: opcode = %b, a = %b, b = %b, out = %b", opcode, a, b, out);

    // Test case 4
    opcode = 2'b01;
    a = 8'b00011111;
    b = 8'b00010001;
    #5 $display("Test case 4: opcode = %b, a = %b, b = %b, out = %b", opcode, a, b, out);

    $finish;
  end

endmodule