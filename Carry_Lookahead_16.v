//Working with TB
module Carry_Lookahead_16(
 input [15:0] x, y,
 input carry_0,
 output wire carry_out, G_out, P_out,
 output [3:0] s_3_0, s_7_4, s_11_8, s_15_12);
 
 wire G0, G4, G8, G12, P0, P4, P8, P12;
 wire carry_4, carry_8, carry_12;
 
 Carry_Lookahead_4 Add_1(x[3:0], y[3:0], carry_0, s_3_0[0], s_3_0[1], s_3_0[2], s_3_0[3], carry_4, G0, P0);
 Carry_Lookahead_4 Add_2(x[7:4], y[7:4], carry_4, s_7_4[0], s_7_4[1], s_7_4[2], s_7_4[3], carry_8, G4, P4);
 Carry_Lookahead_4 Add_3(x[11:8], y[11:8], carry_8, s_11_8[0], s_11_8[1], s_11_8[2], s_11_8[3], carry_12, G8, P8);
 Carry_Lookahead_4 Add_4(x[15:12], y[15:12], carry_12, s_15_12[0], s_15_12[1], s_15_12[2], s_15_12[3], carry_out, G12, P12);
	
 assign P_out = P0 * P4 * P8 * P12;
 assign G_out = G12 + G8*P12 + G4*P12*P8 + G0*P12*P8*P4;

endmodule
