`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:19:55 05/22/2015
// Design Name:   IM
// Module Name:   C:/Users/one/Desktop/Computer Architecture/Project/Alur/IM_tb.v
// Project Name:  Alur
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IM_tb; 
        //input
	reg [31:0] addr; 
	reg clk; 
	
	//output
	wire [31:0] inst; 
	 integer i;

	// Instantiate the Unit Under Test (UUT)
	IM uut (
		.addr(addr), 
		.inst(inst), 
		.clk(clk)
	);


	initial begin 
		clk = 0;
		#100 clk = ~clk;
	end
	
	initial begin
		addr=0;
		#100
		addr=1;		
	end
end
endmodule 


