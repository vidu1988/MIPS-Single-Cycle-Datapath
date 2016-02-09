`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:38 06/01/2015 
// Design Name: 
// Module Name:    ALU_Control 
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
module ALU_Control(
			funct,
		   ALUOp,
		   ALUCtrl
		   );
   
   input [5:0]	funct;		// 6-bit represents instruction's 'address' part
   input [2:0] 	ALUOp;		// 3-bit comes from Control
   output [2:0] ALUCtrl;	// 3-bit control signal represents the operation type, e.g. add, or etc..
   
   reg [2:0] 	ALUCtrl;
      
   always @(ALUOp or funct)
     case(ALUOp)
       3'b010:
	 ALUCtrl = 3'b010;
       3'b011:
	 ALUCtrl = 3'b110;
       3'b000:
	 ALUCtrl = 3'b000;
       3'b001:
	 ALUCtrl = 3'b001;
       3'b100:
	 case(funct)
	   6'b100000:
	     ALUCtrl = 3'b010;
	   6'b100010:
	     ALUCtrl = 3'b110;
	   6'b100100:
	     ALUCtrl = 3'b000;
	   6'b100101:
	     ALUCtrl = 3'b001;
	   6'b101010:
	     ALUCtrl = 3'b111;
	 endcase // case (funct)
     endcase // case (ALUOp)


endmodule
