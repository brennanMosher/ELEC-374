`timescale 1ns/10ps
module AND_32_BIT_TB;

reg [31:0] x, y;
wire [31:0] Zlow, Zhigh;

AND_32_BIT logical_and(x, y, Zlow, Zhigh);

reg [2:0] present_state = 2'b00;
reg clock;

initial begin
	y = 32'b10101010101010101010101010101010;
	
	clock = 0;
	forever #10 clock = ~clock;
end

always @ (present_state) begin
	case(present_state)
		0 : begin
			x = 32'b01010101010101010101010101010101;
		end
		1 : begin
			x = 32'b00000000000000001111111111111111;
		end
		2 : begin
			x = 32'b10101010101010101010101010101010;
		end
		default : begin
			x = 32'b00000000000000000000000000000001;
		end
	endcase
end

always @ (posedge clock) begin
	present_state = present_state + 1;
	if (present_state == 3) begin
		present_state = 0;
	end
end
endmodule