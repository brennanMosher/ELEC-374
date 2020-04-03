module Carry_Lookahead_32_TB;

 reg [31:0] x, y;
 reg carry_0;
 wire G_out, P_out, carry_out;
 wire[15:0] s_15_0, s_31_16;

 Carry_Lookahead_32 carry_32(x, y, 0, G_out, P_out, carry_out, s_15_0, s_31_16);

reg clock;

initial begin
	x = 710200;
	y = 15150;
	carry_0 = 0;
	

end
endmodule
