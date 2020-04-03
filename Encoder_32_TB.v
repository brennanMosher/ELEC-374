`timescale 1ns/10ps
module Encoder_32_TB;
 reg R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
 reg HIout, LOout, Zhighout, Zlowout, PCout, MDRout, In_Portout, Cout;
 wire [4:0] S;
 
 Encoder32_5 E(R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, In_Portout, Cout, S);
 
 reg [31:0] present_state = 32'b000_0000_0000_0000_0000_0001;
 reg clock;
 
initial begin
	R0out = 0;
	R1out = 0;
	R2out = 0;
	R3out = 0;
	R4out = 0;
	R5out = 0;
	R6out = 0;
	R7out = 0;
	R8out = 0;
	R9out = 0;
	R10out = 0;
	R11out = 0;
	R12out = 0;
	R13out = 0;
	R14out = 0;
	R15out = 0;
	HIout = 0;
	LOout = 0;
	Zhighout = 0; 
	Zlowout = 0;
	PCout = 0;
	MDRout = 0; 
	In_Portout = 0;
	Cout = 0;
	clock = 0;
	forever #10 clock = ~clock;
end

always @ * begin 
	case(present_state)
		2**0 : begin
			Cout <= 0;
			R0out <= 1;
		end
		2**1 : begin 
			R0out <= 0;
			R1out <= 1;
		end
		2**2 : begin 
			R1out <= 0;
			R2out <= 1;
		end
		2**3 : begin 
			R2out <= 0;
			R3out <= 1;
		end
		2**4 : begin 
			R3out <= 0;
			R4out <= 1;
		end
		2**5 : begin 
			R4out <= 0;
			R5out <= 1;
		end
		2**6 : begin 
			R5out <= 0;
			R6out <= 1;
		end
		2**7 : begin 
			R6out <= 0;
			R7out <= 1;
		end
		2**8 : begin 
			R7out <= 0;
			R8out <= 1;
		end
		2**9 : begin 
			R8out <= 0;
			R9out <= 1;
		end
		2**10 : begin 
			R9out <= 0;
			R10out <= 1;
		end
		2**11 : begin 
			R10out <= 0;
			R11out <= 1;
		end
		2**12 : begin 
			R11out <= 0;
			R12out <= 1;
		end
		2**13 : begin 
			R12out <= 0;
			R13out <= 1;
		end
		2**14 : begin 
			R13out <= 0;
			R14out <= 1;
		end
		2**15 : begin 
			R14out <= 0;
			R15out <= 1;
		end
		2**16 : begin 
			R15out <= 0;
			HIout <= 1;
		end
		2**17 : begin 
			HIout <= 0;
			LOout <= 1;
		end
		2**18 : begin 
			LOout <= 0;
			Zhighout <= 1;
		end
		2**19 : begin 
			Zhighout <= 0;
			Zlowout <= 1;
		end
		2**20 : begin 
			Zlowout <= 0;
			PCout <= 1;
		end
		2**21 : begin 
			PCout <= 0;
			MDRout <= 1;
		end
		2**22 : begin 
			MDRout <= 0;
			In_Portout <= 1;
		end
		2**23 : begin 
			In_Portout <= 0;
			Cout <= 1;
		end
		default : begin
			R0out <= 1;
		end
	endcase
end

always @(posedge clock) begin
	present_state = present_state << 1;
	if(present_state == 32'b1_0000_0000_0000_0000_0000_0000) begin
		present_state = 32'b000_0000_0000_0000_0000_0001;
	end 
end

endmodule 