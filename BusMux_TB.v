`timescale 1ns/10ps
module BusMux_TB;

reg R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
reg HIout, LOout, Zhighout, Zlowout, PCout, MDRout, In_Portout, Cout;

reg [31:0] busMuxIn_R0in, busMuxIn_R1in, busMuxIn_R2in, busMuxIn_R3in, busMuxIn_R4in, busMuxIn_R5in, busMuxIn_R6in, busMuxIn_R7in, busMuxIn_R8in, 
			  busMuxIn_R9in, busMuxIn_R10in, busMuxIn_R11in, busMuxIn_R12in, busMuxIn_R13in, busMuxIn_R14in, busMuxIn_R15in, busMuxIn_HIin, 
			  busMuxIn_LOin, busMuxIn_Zhighin, busMuxIn_Zlowin, busMuxIn_PCin, busMuxIn_MDRin, busMuxIn_In_Portin, busMuxIn_C_sign_extended; 
				  
wire [31:0] BusMuxOut;

BusMux busMux(R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, 
				  Zhighout, Zlowout, PCout, MDRout, In_Portout, Cout,
				  busMuxIn_R0in, busMuxIn_R1in, busMuxIn_R2in, busMuxIn_R3in, busMuxIn_R4in, busMuxIn_R5in, busMuxIn_R6in, busMuxIn_R7in, busMuxIn_R8in, 
				  busMuxIn_R9in, busMuxIn_R10in, busMuxIn_R11in, busMuxIn_R12in, busMuxIn_R13in, busMuxIn_R14in, busMuxIn_R15in, busMuxIn_HIin, 
				  busMuxIn_LOin, busMuxIn_Zhighin, busMuxIn_Zlowin, busMuxIn_PCin, busMuxIn_MDRin, busMuxIn_In_Portin, busMuxIn_C_sign_extended, BusMuxOut);
				 
initial begin 
	R7out <= 1;
	busMuxIn_R7in <= 32'd23;
end
endmodule
