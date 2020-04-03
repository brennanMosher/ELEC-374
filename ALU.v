module ALU(
  // Signal that tells us to increment PC,busMuxOut used as PC value to be incremented and put into Zlow
  input incPC,
  input [11:0] ALUin, 
  input [31:0] register, busMuxOut,
  output [31:0] zlow, zhigh);
  
  wire [31:0] zlowPC, zhighPC, zlowAND, zhighAND, zlowOR, zhighOR, zlowNEG, zhighNEG, zlowNOT, zhighNOT, zlowADD, zhighADD, zlowSUB, zhighSUB;
  wire [31:0] zlowMUL, zhighMUL, zlowDIV, zhighDIV, zlowSHR, zhighSHR, zlowSHL, zhighSHL, zlowROR, zhighROR, zlowROL, zhighROL;
  
  reg [31:0] zlowTemp, zhighTemp;
  
	ADD increment_PC(1, busMuxOut, zlowPC, zhighPC);
	
  	AND_32_BIT AND_LOGIC(register, busMuxOut, zlowAND, zhighAND);
	OR_32_Bit OR_LOGIC(register, busMuxOut, zlowOR, zhighOR);
	NEG NEG_LOGIC(0, busMuxOut, zlowNEG, zhighNEG);
	NOT_32_BIT NOT_LOGIC(0, busMuxOut, zlowNOT, zhighNOT);
	ADD ADD_LOGIC(register, busMuxOut, zlowADD, zhighADD);
	SUB SUB_LOGIC(register, busMuxOut, zlowSUB, zhighSUB);
	MUL MUL_LOGIC(register, busMuxOut, zlowMUL, zhighMUL);
	DIV DIV_LOGIC(register, busMuxOut, zlowDIV, zhighDIV);
	ShiftRight SHR_LOGIC(register, busMuxOut, zlowSHR, zhighSHR);
	ShiftLeft SHL_LOGIC(register, busMuxOut, zlowSHL, zhighSHL);
	RotateRight ROR_LOGIC(register, busMuxOut, zlowROR, zhighROR);
	RotateLeft ROL_LOGIC(register, busMuxOut, zlowROL, zhighROL);
	
	always @ * begin
		if(incPC == 1) begin
			zlowTemp <= zlowPC;
			zhighTemp <= zhighPC;
		end else if(ALUin[11] == 1) begin
			zlowTemp <= zlowAND;
			zhighTemp <= zhighAND;
		end else if (ALUin[10] == 1) begin
			zlowTemp <= zlowOR;
			zhighTemp <= zhighOR;
		end else if (ALUin[9] == 1) begin
			zlowTemp <= zlowNEG;
			zhighTemp <= zhighNEG;
		end else if (ALUin[8] == 1) begin
			zlowTemp <= zlowNOT;
			zhighTemp <= zhighNOT;
		end else if (ALUin[7] == 1) begin
			zlowTemp <= zlowADD;
			zhighTemp <= zhighADD;
		end else if (ALUin[6] == 1) begin
			zlowTemp <= zlowSUB;
			zhighTemp <= zhighSUB;
		end else if (ALUin[5] == 1) begin
			zlowTemp <= zlowMUL;
			zhighTemp <= zhighMUL;
		end else if (ALUin[4] == 1) begin
			zlowTemp <= zlowDIV;
			zhighTemp <= zhighDIV;
		end else if (ALUin[3] == 1) begin
			zlowTemp <= zlowSHR;
			zhighTemp <= zhighSHR;
		end else if (ALUin[2] == 1) begin
			zlowTemp <= zlowSHL;
			zhighTemp <= zhighSHL;
		end else if (ALUin[1] == 1) begin
			zlowTemp <= zlowROR;
			zhighTemp <= zhighROR;
		end else if (ALUin[0] == 1) begin
			zlowTemp <= zlowROL;
			zhighTemp <= zhighROL;
		end 
	end
	
	assign zlow = zlowTemp;
	assign zhigh = zhighTemp;
	
	
endmodule
	