`timescale 1ns/10ps
module DIV_TB;

reg [31:0] x, y;
wire [31:0] zlow, zhigh;

DIV restoring_div(x, y, zlow, zhigh);

initial begin
	x = 32'b0000_0000_0000_0000_0000_0000_0001_0000;
	y = 32'b0000_0000_0000_0000_0000_0000_1110_1010;
end
endmodule 