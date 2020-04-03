module ADD(
 input [31:0] x, y,
 output[31:0] zlow, zhigh);
 
 // Wires for carry lookahead
 wire G_out, P_out, carry_out;
 
 
 Carry_Lookahead_32 carry_32(x, y, 0, G_out, P_out, carry_out, zlow[15:0], zlow[31:16]);
 
 assign zhigh = 0;
 
endmodule
