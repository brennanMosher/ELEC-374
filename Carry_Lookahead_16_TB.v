`timescale 1ns/10ps
module Carry_Lookahead_16_TB;

reg [15:0] x, y;
reg carry_0;
wire [3:0] s_3_0, s_7_4, s_11_8, s_15_12;
wire carry_out, G_out, P_out;

Carry_Lookahead_16 carry_look16(x, y, carry_0, carry_out, G_out, P_out, s_3_0, s_7_4, s_11_8, s_15_12);

reg clock;

initial begin
	x = 712;
	y = 515;
	carry_0 = 0;
	
	clock = 0;
	forever #10 clock = ~clock;
end
endmodule
