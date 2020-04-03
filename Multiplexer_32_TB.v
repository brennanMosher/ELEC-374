`timescale 1ns/10ps
module Multiplexer_32_TB;
 //Not sure that you can do this, may need to do it individually for all of them
 reg [31:0] R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
 reg [31:0] HIout, LOout, Zhighout, Zlowout, PCout, MDRout, In_Portout, Cout;
 reg [4:0] S;
 wire [31:0] busMuxOut;
 
 //Not sure how to do the diffferent line things
 Multiplexer32_1 MUX(R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, In_Portout, Cout, S, busMuxOut);
 
 //For this one its easier to increment this value instead of having set states
 reg [4:0] present_state = 5'b00000;
 reg clock;
 
 initial begin
	//Need to intialize the outputs
	R0out = 1;
	R1out = 2;
	R2out = 3;
	R3out = 4;
	R4out = 5;
	R5out = 6;
	R6out = 7;
	R7out = 8;
	R8out = 9;
	R9out = 10;
	R10out = 11;
	R11out = 12;
	R12out = 13;
	R13out = 14;
	R14out = 15;
	R15out = 16;
	HIout = 17;
	LOout = 18;
	Zhighout = 19;
	Zlowout = 20;
	PCout = 21;
	MDRout = 22;
	In_Portout = 23;
	Cout = 24;
	
	clock = 0;
	forever #10 clock = ~clock;
	
end

always @(present_state)
begin
	case(present_state)
		0 : begin
			S <= 0;
		end
		1 : begin
			S <= 1;
		end
		2 : begin
			S <= 2;
		end
		3 : begin
			S <= 3;
		end
		4 : begin
			S <= 4;
		end
		5 : begin
			S <= 5;
		end
		6 : begin
			S <= 6;
		end
		7 : begin
			S <= 7;
		end
		8 : begin
			S <= 8;
		end
		9 : begin
			S <= 9;
		end
		10 : begin
			S <= 10;
		end
		11 : begin
			S <= 11;
		end
		12 : begin
			S <= 12;
		end
		13 : begin
			S <= 13;
		end
		14 : begin
			S <= 14;
		end
		15 : begin
			S <= 15;
		end
		16 : begin
			S <= 16;
		end
		17 : begin
			S <= 17;
		end
		18 : begin
			S <= 18;
		end
		19 : begin
			S <= 19;
		end
		20 : begin
			S <= 20;
		end
		21 : begin
			S <= 21;
		end
		22 : begin
			S <= 22;
		end
		23 : begin
			S <= 23;
		end
		default : begin 
			S <= 0;
		end
	endcase
end

always @(posedge clock) begin
	present_state = present_state + 1;
	if(present_state == 24) begin
		present_state = 0;
	end
end 

endmodule 