module NEG(
 input [31:0] x, y,
 output wire[31:0] zlow, zhigh);
 
 reg [5:0] i;
 wire [31:0] zlow_temp, unusued_wire;
 
 NOT_32_BIT not_negate(0, y, zlow_temp, unused_wire);
 ADD add_1(zlow_temp, 1, zlow, zhigh);
 
endmodule
