`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:29:13 05/21/2015
// Design Name:   ALU
// Module Name:   C:/Users/one/Desktop/Computer Architecture/Project/Alur/alu_tb.v
// Project Name:  Alur
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [3:0] ALUop;

	// Outputs
	wire [31:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.result(result), 
		.zero(zero), 
		.ALUop(ALUop)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		ALUop = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 0;
		b = 1;
		ALUop = 1;
		#100;
		
		a = 0;
		b = 1;
		ALUop = 2;
		#100;



	end
      
endmodule

