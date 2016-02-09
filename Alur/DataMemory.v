`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:28 06/01/2015 
// Design Name: 
// Module Name:    DataMemory 
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
module Data_Memory(
    clk,
    addr,
    data_in,
    MemRead,
    MemWrite,
    data_out,
	 
);

// Interface
input           clk;
input   [31:0]  addr;
input   [31:0]  data_in;
input           MemRead;
input           MemWrite;
output  [31:0]  data_out;

// Data memory is byte-addressable, data are byte-aligned
// Data memory with 32 Bytes
// Data address range: 0x00 ~ 0x1F
parameter MEM_SIZE=32;
integer i;
reg	    [7:0]   memory  [0:MEM_SIZE-1];

initial begin
// Initialize data memory
    for(i=0; i<32; i=i+1) begin
       memory[i] = 8'b0;
    end 

// Set Input n into data memory at 0x05
   memory[20] = 8'h14;       // n = 20 for example	 
end

// Write Data      
always @(posedge clk)
begin
    if (MemWrite)
    begin //Vidushi's modification *4
        memory[addr*4+3] <= data_in[31:24];
        memory[addr*4+2] <= data_in[23:16];
        memory[addr*4+1] <= data_in[15:8];
        memory[addr*4]   <= data_in[7:0];
    end
end

// Read Data      
assign  data_out = (MemRead) ? {memory[addr*4+3], memory[addr*4+2], memory[addr*4+1], memory[addr*4]} : 32'b0;
endmodule