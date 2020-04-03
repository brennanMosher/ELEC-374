// Works with TB
module Carry_Lookahead_4(
 input [3:0] x, y,
 input carry_0,
 output s0, s1, s2, s3,
 output wire carry_4, G_out, P_out);
 
 wire G0, G1, G2, G3, P0, P1, P2, P3;
 wire carry_1, carry_2, carry_3;

 assign carry_1 = G0 + P0*carry_0;
	
 assign carry_2 = G1 + P1*carry_1;
	
 assign carry_3 = G2 + P2*carry_2;
	
 assign carry_4 = G3 + P3*carry_3;
 
 	// Hook inputs into the first B cell
 B_Cell b1(x[0], y[0], carry_0, G0, P0, s0);
 B_Cell b2(x[1], y[1], carry_1, G1, P1, s1);
 B_Cell b3(x[2], y[2], carry_2, G2, P2, s2);
 B_Cell b4(x[3], y[3], carry_3, G3, P3, s3);


 // Update carry based on output of first B cell
 assign P_out = P0 * P1 * P2 * P3;
 assign G_out = G3 + G2*P3 + G1*P3*P2 + G0*P3*P2*P1;

endmodule
