`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:11 05/22/2015 
// Design Name: 
// Module Name:    MIPS_regfile_alu 
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
module MIPS_regfile_alu(clk, read_reg1, read_reg2, write_reg, write_data, ALUop, MUXsel,RegWrite, in1, ALUout, ALUzero);
// IOs
input clk;
input [4:0] read_reg1, read_reg2, write_reg;
input [31:0] write_data;
input [3:0] ALUop;
input MUXsel;
input RegWrite;
input in1;
output [31:0] ALUout;
output ALUzero;
// interconnections
wire [31:0] alu_A, reg_data2, MUXout;
MIPSREGMEM mipsregmem_0 (
// inputs
.clk( clk ),
.read_reg1( read_reg1 ),
.read_reg2( read_reg2 ),
.write_reg( write_reg),
.write_data( write_data ),
.RegWrite (RegWrite),
// outputs
.read_data1( alu_A ),
.read_data2( reg_data2 )
);
MUX mux_0 (
// inputs
.MUXsel( MUXsel ),
.in0( reg_data2 ),
.in1( in1 ),
// outputs
.MUXout( MUXout )
);
MIPSALU mipsalu_0 (
// inputs
ALUop (ALUop),
.A( alu_A ),
.B( MUXout ),
// outputs
.ALUOut( ALUout ),
.zero ( ALUzero )
);

endmodule
