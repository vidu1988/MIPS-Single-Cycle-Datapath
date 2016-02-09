`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:12:44 06/02/2015 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    data1_in,
	data2_in,
	ALUCtrl,
	data,
	Zero
);

input	[31:0]	data1_in;
input	[31:0]	data2_in;
input	[2:0]	ALUCtrl;
output	[31:0]	data;
output			Zero;

reg [31:0] data;
reg Zero;

always @(data1_in or data2_in or ALUCtrl) begin
	// ALUCtrl = 010 (add, lw, sw)
	if (~ALUCtrl[2] & ALUCtrl[1] & ~ALUCtrl[0]) begin
		data = data1_in + data2_in;
		if (data == 32'b0) begin
			Zero = 1'b1;
		end
		else begin
			Zero = 1'b0;
		end
	end
	
	// ALUCtrl = 110 (sub, beq)
	if (ALUCtrl[2] & ALUCtrl[1] & ~ALUCtrl[0]) begin
		data = data1_in - data2_in;
		if (data == 32'b0) begin
			Zero = 1'b1;
		end
		else begin
			Zero = 1'b0;
		end
	end
	
	// ALUCtrl = 000 (and)
	if (~ALUCtrl[2] & ~ALUCtrl[1] & ~ALUCtrl[0]) begin
		data = data1_in & data2_in;
		if (data == 32'b0) begin
			Zero = 1'b1;
		end
		else begin
			Zero = 1'b0;
		end
	end
	
	// ALUCtrl = 001 (or)
	if (~ALUCtrl[2] & ~ALUCtrl[1] & ALUCtrl[0]) begin
		data = data1_in | data2_in;
		if (data == 32'b0) begin
			Zero = 1'b1;
		end
		else begin
			Zero = 1'b0;
		end
	end
	
	// ALUCtrl = 111 (slt)
	// We do not need to set/reset Zero
	if (ALUCtrl[2] & ALUCtrl[1] & ALUCtrl[0]) begin
		if ((data1_in - data2_in) < 0) begin
			data = 32'b1;
		end
		else begin
			data = 32'b0;
		end
	end
end

endmodule

