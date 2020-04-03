module Multiplexer32_1(
input [31:0] BusMuxIn_R0in, BusMuxIn_R1in, BusMuxIn_R2in, BusMuxIn_R3in, BusMuxIn_R4in, BusMuxIn_R5in, BusMuxIn_R6in, BusMuxIn_R7in, BusMuxIn_R8in, BusMuxIn_R9in, BusMuxIn_R10in, BusMuxIn_R11in, BusMuxIn_R12in, BusMuxIn_R13in, BusMuxIn_R14in, BusMuxIn_R15in,
input [31:0] BusMuxIn_HIin, BusMuxIn_LOin, BusMuxIn_Zhighin, BusMuxIn_Zlowin, BusMuxIn_PCin, BusMuxIn_MDRin, BusMuxIn_In_Portin, BusMuxIn_C_sign_extended,
input [4:0] S,
output [31:0] BusMuxOut);

reg [31:0] temp_bus;
 
//Whenever the multiplexer inputs change
always @ * begin
	
	if(S == 0) begin
		temp_bus <= BusMuxIn_R0in;
	end else if(S == 1) begin
		temp_bus <= BusMuxIn_R1in;
	end else if(S == 2) begin
		temp_bus <= BusMuxIn_R2in;
	end else if(S == 3) begin
		temp_bus <= BusMuxIn_R3in;
	end else if(S == 4) begin
		temp_bus <= BusMuxIn_R4in;
	end else if(S == 5) begin
		temp_bus <= BusMuxIn_R5in;
	end else if(S == 6) begin
		temp_bus <= BusMuxIn_R6in;
	end else if(S == 7) begin
		temp_bus <= BusMuxIn_R7in;
	end else if(S == 8) begin 
		temp_bus <= BusMuxIn_R8in;
	end else if(S == 9) begin
		temp_bus <= BusMuxIn_R9in;
	end else if(S == 10) begin
		temp_bus <= BusMuxIn_R10in;
	end else if(S == 11) begin
		temp_bus <= BusMuxIn_R11in;
	end else if(S == 12) begin
		temp_bus <= BusMuxIn_R12in;
	end else if(S == 13) begin
		temp_bus <= BusMuxIn_R13in;
	end else if(S == 14) begin
		temp_bus <= BusMuxIn_R14in;
	end else if(S == 15) begin
		temp_bus <= BusMuxIn_R15in;
	end else if(S == 16) begin
		temp_bus <= BusMuxIn_HIin;
	end else if(S == 17) begin
		temp_bus <= BusMuxIn_LOin;
	end else if(S == 18) begin
		temp_bus <= BusMuxIn_Zhighin;
	end else if(S == 19) begin
		temp_bus <= BusMuxIn_Zlowin;
	end else if(S == 20) begin
		temp_bus <= BusMuxIn_PCin;
	end else if(S == 21) begin
		temp_bus <= BusMuxIn_MDRin;
	end else if(S == 22) begin
		temp_bus <= BusMuxIn_In_Portin;
	end else if(S == 23) begin
		temp_bus <= BusMuxIn_C_sign_extended;
	end else begin
		temp_bus <= BusMuxOut;
	end 
end

assign BusMuxOut = temp_bus;
endmodule
