module Multiplexer2(
 input [31:0] x, y,
 input s,
 output reg [31:0] w);
 
 always @(s) begin
	
	if(s == 0) begin
		w <= x;
	end else begin 
		w <= y;
	end
end 

endmodule 
