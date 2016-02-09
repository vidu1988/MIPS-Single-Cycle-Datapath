`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:15:02 05/22/2015 
// Design Name: 
// Module Name:    IM 
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

module Instr_Memory(
    addr,
    instr
);

// Interface
input   [31:0]  addr;
output  [31:0]  instr;

// Instruction memory is byte-addressable, instructions are word-aligned
// Instruction memory with 256 32-bit words

parameter MEM_SIZE=256;
reg     [31:0] memory  [0:MEM_SIZE-1];
integer i;

initial begin
 // Initialize instruction memory
   for(i=0; i<256; i=i+1) begin
        CPU.Instr_Memory.memory[i] = 32'b0;
    end
	 
 // Load instructions into instruction memory
    $readmemb("instruction.txt", CPU.Instr_Memory.memory);
 end

assign  instr = memory[addr>>2];  

endmodule





