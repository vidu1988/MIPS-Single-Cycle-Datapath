`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:13 06/01/2015 
// Design Name: 
// Module Name:    MIPS_SingleCycleCPU 
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
module MIPS_SingleCycleCPU(
   clk,
   rst_n
);

// input/output declaration
input   clk, rst_n;

// Wire/Reg declaration

wire RegDST, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Zero, Branch_Zero;
wire [2:0] ALUOp, ALUCtrl;
wire [4:0] mux_RegDST;
wire [31:0] mux_ALUSrc, mux_Branch, mux_MemtoReg, Instr, pc, PC_4, Rs_Data, Rt_Data, Immediate, Offset, PC_Offset, ALUResult, MemData;

assign Offset = Immediate << 2;
assign Branch_Zero = Branch & Zero;
   
// Connecting PC component with input(mux_Branch) and its output on wire pc
PC PC(
    .clk        (clk),
    .rst_n      (rst_n),
    .pc_in      (mux_Branch),
    .pc_out     (pc)
);

// Connecting PC value with adder adding 4 so as to get PC+4 on wire PC_4
Adder PC_Add_4(
    .data1_in   (pc),
    .data2_in   (32'd4),
    .data_out   (PC_4)
);

//Connecting PC with Instruction Memory and Giving current instruction on wire Instr
Instr_Memory Instr_Memory(
    .addr       (pc), 
    .instr      (Instr)
);


// Connecting Instr[31:26] with the opcode input of control and all 8 outputs in their respective wires
Control Control(
    .opcode     (Instr[31:26]),
    .RegDst     (RegDST),
    .Branch     (Branch),
    .MemRead    (MemRead),
    .MemtoReg   (MemtoReg),
    .ALUOp      (ALUOp),
    .MemWrite   (MemWrite),
    .ALUSrc     (ALUSrc),
    .RegWrite   (RegWrite)
);

// Connecting MUX with Write Register Input(Instr[20-16] or Instr[15-11] of REGISTER File
MUX_5bit MUX_RegDst(
    .data1_in   (Instr[20:16]),
    .data2_in   (Instr[15:11]),
    .select     (RegDST),
    .data_out   (mux_RegDST)
);

//Connecting inputs of REGISTER File and its output(Read data1(Rs_data),read data 2(Rt_Data))
Register_File Register_File(
    .clk        (clk),
    .Rs_addr    (Instr[25:21]),
    .Rt_addr    (Instr[20:16]),
    .Rd_addr    (mux_RegDST), 
    .Rd_data    (mux_MemtoReg),
    .RegWrite   (RegWrite), 
    .Rs_data    (Rs_Data), 
    .Rt_data    (Rt_Data) 
);

// Connecting Instr[15:0] with the imput of sign extend unit and providing 32 bit output on Immediate wire
Signed_Extend Signed_Extend(
    .data_in    (Instr[15:0]),
    .data_out   (Immediate)
);


// Adder which adds PC_4(PC+4) with offset left shifted by 2(for beq instructions) and getting its output on wire PC_Offset 
Adder PC_Add_Offset(
    .data1_in   (PC_4),
    .data2_in   (Offset),
    .data_out   (PC_Offset)
);


// Connecting MUX(To decide ALU's 2nd source(either Rt_Data or offset)) with wire mux_ALUSrc
MUX_32bit MUX_ALUSrc(
    .data1_in   (Rt_Data),
    .data2_in   (Immediate),
    .select     (ALUSrc),
    .data_out   (mux_ALUSrc)
);

// Connecting ALU control unit with function code(instr[5:0] and control's ALUOp , giving output on wire ALUCtrl
ALU_Control ALU_Control(
    .funct      (Instr[5:0]),
    .ALUOp      (ALUOp),
    .ALUCtrl    (ALUCtrl)
);

//Connecting Inputs of ALU with Rs_Data and mux_ALUSrc etc.. and its output on wire zero and ALUResult  
ALU ALU(
    .data1_in   (Rs_Data),
    .data2_in   (mux_ALUSrc),
    .ALUCtrl    (ALUCtrl),
    .data       (ALUResult),
    .Zero       (Zero)
);

// Connecting MUX (PC+4 or PC_Offset(branching)) with selction input Branch_Zero(Branch AND Zero) to give its output on wire mux_Branch
MUX_32bit MUX_Branch(
    .data1_in   (PC_4),
    .data2_in   (PC_Offset),
    .select     (Branch_Zero),
    .data_out   (mux_Branch)
);

//Connecting inputs of Data Memory and giving outputs on wire MemData
Data_Memory Data_Memory(
    .clk        (clk),
    .addr       (ALUResult),
    .data_in    (Rt_Data),
    .MemRead    (MemRead),
    .MemWrite   (MemWrite),
    .data_out   (MemData)
);

// Connecting MUX(either MemData or ALUResult) to give output on wire mux_MemtoReg
MUX_32bit MUX_MemtoReg(
    .data1_in   (ALUResult),
    .data2_in   (MemData),
    .select     (MemtoReg),
    .data_out   (mux_MemtoReg)
);

endmodule
