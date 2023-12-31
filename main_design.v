module main_design (input wire [1:0] opcode, input wire [7:0] a, b, output reg [7:0] out);
  
  wire [7:0] temp_out_nand;
  wire [7:0] temp_out_xor;
  wire [7:0] temp_out_adder;
  wire [7:0] temp_out_function;

  full_adder_component adder_inst(.a(a), .b(b), .out(temp_out_adder));
  xor_component xor_inst(.a(a), .b(b), .out(temp_out_xor));
  nand_component nand_inst(.a(a), .b(b), .out(temp_out_nand));
  function_component function_inst(.a(a), .b(b), .out(temp_out_function));

  always @(*) begin
    case (opcode)
      2'b00: out = temp_out_adder;      // If opcode is "00", use the full_adder_component
      2'b01: out = temp_out_xor;        // If opcode is "01", use the xor_component
      2'b10: out = temp_out_nand;       // If opcode is "10", use the nand_component
      default: out = temp_out_function; // For other opcodes, use the output of function_component
    endcase
  end

endmodule