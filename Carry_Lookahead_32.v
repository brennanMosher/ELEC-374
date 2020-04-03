//Working with TB
module Carry_Lookahead_32(
 input [31:0] x, y,
 input carry_0,
 output G_out, P_out, carry_out,
 output [15:0] s_15_0, s_31_16);
 
 wire G0, P0, G1, P1;
 wire carry;
	
 Carry_Lookahead_16 Add_1(x[15:0], y[15:0], carry_0, carry, G0, P0, s_15_0[3:0], s_15_0[7:4], s_15_0[11:8], s_15_0[15:12]);
 Carry_Lookahead_16 Add_2(x[31:16], y[31:16], carry, carry_out, G1, P1, s_31_16[3:0], s_31_16[7:4], s_31_16[11:8], s_31_16[15:12]);

 assign P_out = P0 * P1; 
 assign G_out = G1 + G0*P1; 


endmodule
