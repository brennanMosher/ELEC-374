module NOT_32_BIT(
 input [31:0] x, y,
 output [31:0] zlow, zhigh);
 
 reg [5:0] i;
 reg [31:0] zlow_temp;
 
 always @(x or y) begin
	for(i=0;i<32;i = i+1) begin
		if(y[i] == 1) begin
			zlow_temp[i] = 0;
		end else begin
			zlow_temp[i] = 1;
		end
	end 
 end 
 assign zlow = zlow_temp;
 assign zhigh = 0;
 
endmodule
