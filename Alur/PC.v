`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:59 06/01/2015 
// Design Name: 
// Module Name:    PC 
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
module PC(
    clk,
    rst_n,
    pc_in,
    pc_out
);

// Interface
input           clk;
input           rst_n;
input   [31:0]  pc_in;
output  [31:0]  pc_out;

// Wire/Reg
reg     [31:0]  pc_out;

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
    begin
        pc_out <= 32'b0;
    end
    else
    begin
        pc_out <= pc_in;
    end
end

endmodule
