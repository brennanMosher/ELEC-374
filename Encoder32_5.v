module Encoder32_5(
input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
input HIout, LOout, Zhighout, Zlowout, PCout, MDRout, In_Portout, Cout,
output reg [4:0] S);
 
 
always @ * begin
	if(R0out == 1'b1) begin
		S <= 5'd0;
	end else if(R1out == 1'b1) begin 
		S <= 5'd1;
	end else if(R2out == 1'b1) begin 
		S <= 5'd2;
	end else if(R3out == 1'b1) begin 
		S <= 5'd3;
	end else if(R4out == 1'b1) begin 
		S <= 5'd4;
	end else if(R5out == 1'b1) begin 
		S <= 5'd5;
	end else if(R6out == 1'b1) begin 
		S <= 5'd6;
	end else if(R7out == 1'b1) begin 
		S <= 5'd7;
	end else if(R8out == 1'b1) begin 
		S <= 5'd8;
	end else if(R9out == 1'b1) begin 
		S <= 5'd9;
	end else if(R10out == 1'b1) begin 
		S <= 5'd10;
	end else if(R11out == 1'b1) begin 
		S <= 5'd11;
	end else if(R12out == 1'b1) begin 
		S <= 5'd12;
	end else if(R13out == 1'b1) begin 
		S <= 5'd13;
	end else if(R14out == 1'b1) begin 
		S <= 5'd14;
	end else if(R15out == 1'b1) begin 
		S <= 5'd15;
	end else if(HIout == 1'b1) begin 
		S <= 5'd16;
	end else if(LOout == 1'b1) begin 
		S <= 5'd17;
	end else if(Zhighout == 1'b1) begin 
		S <= 5'd18;
	end else if(Zlowout == 1'b1) begin 
		S <= 5'd19;
	end else if(PCout == 1'b1) begin 
		S <= 5'd20;
	end else if(MDRout == 1'b1) begin 
		S <= 5'd21;
	end else if(In_Portout== 1'b1) begin 
		S <= 5'd22;
	end else if(Cout == 1'b1) begin 
		S <= 5'd23;
	end
end
endmodule

