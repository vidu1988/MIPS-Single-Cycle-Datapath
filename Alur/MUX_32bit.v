`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:23 06/01/2015 
// Design Name: 
// Module Name:    MUX_32bit 
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
module MUX_32bit(
   data1_in,
    data2_in,
    select,
    data_out
);

input [31:0] data1_in, data2_in;
input select;
output [31:0] data_out;

assign data_out = (select) ? data2_in : data1_in;


endmodule
