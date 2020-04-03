`timescale 1ns/10ps
module MUL_TB;

reg [31:0] x, y;
wire [31:0] zlow, zhigh;

MUL multiplication(x, y, zlow, zhigh);

reg [1:0] present_state = 2'b00;
reg clock;

initial begin
	y = 32'b0000_0000_0000_0000_0000_0000_1110_1010;
	
	clock = 0; 
	forever #10 clock = ~clock;
end

always @(present_state) begin
	case(present_state)
		2'b00: 	x = 32'b0000_0000_0000_0000_0000_0000_0001_0000;
		2'b01:	x = 32'b0000_0000_0000_0000_0000_0000_0000_1100;
		2'b10:	x = 32'b0000_0000_0000_0000_0000_0000_0001_0101;
	endcase
end

always @(posedge clock) begin
	present_state = present_state + 1;
	if (present_state == 3) begin
		present_state = 0;
	end
end
endmodule 