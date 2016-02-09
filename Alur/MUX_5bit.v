`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:31 06/01/2015 
// Design Name: 
// Module Name:    MUX_5bit 
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
module MUX_5bit(
    data1_in,
    data2_in,
    select,
    data_out
);

input [4:0] data1_in, data2_in;
input select;
output [4:0] data_out;

assign data_out = (select) ? data2_in : data1_in;
endmodule
