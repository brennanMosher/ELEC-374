// Working with TB
module AND_32_BIT(
 input [31:0] x, y,
 output [31:0] zlow, zhigh);
 
 // Initialize i for loop
 reg [5:0] i;
 reg [31:0] zlow_temp;
 
 always @(x or y) begin 
	// Loop through all bits in x and y
	for(i=0;i<32;i = i+1) begin
		if(x[i] == 1'b1 & y[i] == 1'b1) begin
			zlow_temp[i] = 1'b1;
		end else begin
			zlow_temp[i] = 1'b0;
		end
	end
end

assign zlow = zlow_temp;
assign zhigh = 0;

endmodule 

	