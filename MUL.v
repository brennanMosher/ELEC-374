`timescale 1ns/10ps
module MUL(
 // X * Y
 input [31:0] x, y,
 output [31:0] zlow, zhigh);
 
 integer i;

 reg [63:0] P, y_temp, y_temp_neg; 

 reg right_bit;

 
 always @(x or y) begin
	P = 64'd0;
	y_temp = 64'd0 + y;
	y_temp_neg = 64'd0 - y;
	right_bit = 0;
 
	for(i=0;i<32;i =i+1) begin
		// 00 or 11
		if(x[i] != right_bit) begin
			if(right_bit == 1) begin //01
				P = P + (y_temp << i);
			end else begin
				P = P + (y_temp_neg << i);
			end
			if(x[i] == 1) begin
				right_bit = 1;
			end else begin
				right_bit = 0;
			end
		end

	end
 end
 
 assign zlow = P[31:0];
 assign zhigh = P[63:32];
 
 endmodule 