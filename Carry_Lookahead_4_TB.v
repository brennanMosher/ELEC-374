`timescale 1ns/10ps
module Carry_Lookahead_4_TB;

reg [3:0] x, y;
reg carry_0;
wire s0, s1, s2, s3;
wire carry_4, G_out, P_out;

Carry_Lookahead_4 carry_look4(x, y, carry_0, s0, s1, s2, s3, carry_4, G_out, P_out);

reg clock;

initial begin
	x = 4'b0101;
	y = 4'b1010;
	carry_0 = 0;
	
	clock = 0;
	forever #10 clock = ~clock;
end 
endmodule
