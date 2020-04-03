`timescale 1ns/10ps
module ALU_TB;
 
 reg incPC;
 reg [11:0] ALUin;
 reg [31:0]	register, busMuxOut;
 wire [31:0] zlow, zhigh;
 
 ALU testingALU(incPC, ALUin, register, busMuxOut, zlow, zhigh);
 
 initial begin 
	ALUin <= 12'b0000_0010_0000;
	register <= 32'h22;
	busMuxOut <= 32'h24;
end 
endmodule
