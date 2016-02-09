`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:50:35 06/01/2015 
// Design Name: 
// Module Name:    Register_File 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Register_File(
   clk,
    Rs_addr,
    Rt_addr,
    Rd_addr, 
    Rd_data,
    RegWrite, 
    Rs_data, 
    Rt_data 
);

// Interface
input           clk;
input   [4:0]   Rs_addr;
input   [4:0]   Rt_addr;
input   [4:0]   Rd_addr;
input   [31:0]  Rd_data;
input           RegWrite;
output  [31:0]  Rs_data; 
output  [31:0]  Rt_data;

// Register file has 32 32-bit registers
reg     [31:0]  register    [0:31];
integer i;

// Read Data      
assign  Rs_data = (Rs_addr == 5'b0) ? 32'b0 : register[Rs_addr];
assign  Rt_data = (Rt_addr == 5'b0) ? 32'b0 : register[Rt_addr];

initial begin

// initialize Register File. Initially all registers have value 0.
    for(i=0; i<32; i=i+1) begin
        register[i] = 32'b0;
    end
	 
// Set Initial values of register 0,1 and 2 according to question for testing processor
	 register[0] = 32'b0000;
	 register[1] = 32'b0101;
    register[2] = 32'b1010;	  
	 
end

// Write Data   
always @(posedge clk)
begin
    if(RegWrite)
        register[Rd_addr] <= Rd_data;
end

endmodule
