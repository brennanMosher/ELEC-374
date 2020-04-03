`timescale 1ns/10ps
module Multiplexer2_TB;
reg [31:0] x, y;
reg s;
wire [31:0] w;

Multiplexer2 MUX(x, y, s, w);

reg present_state = 1'b0;
reg clock;

initial begin
	x = 2; 
	y = 4;
	clock = 0;
	forever #10 clock = ~clock;
end

always @(present_state) 
begin
	case (present_state)
		0 : begin
			s <= 0;
		end
		1 : begin
			s <= 1;
		end
		default : begin
		
		end
	endcase
end

always @(posedge clock) begin
	present_state = present_state + 1;
	if (present_state == 3) begin
		present_state = 0;
	end
end 

endmodule