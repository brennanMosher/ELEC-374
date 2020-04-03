`timescale 1ns/10ps
module ADD_TB;

reg [31:0] x, y;
wire [31:0] Zlow, Zhigh;

ADD add(x, y, Zlow, Zhigh);

reg [3:0] present_state = 3'b000;
reg clock;

initial begin
	y = 32'b0000_1000_0100_0010_0001_0000_1000_0101;
	clock = 0;
	forever #10 clock = ~clock;
end

always @ (present_state) begin
	case(present_state)
		0 : begin
			x <= 32'b0000_0000_0000_0000_0000_0000_0000_0101;
		end
		1 : begin
			x <= 32'b0000_0000_0000_0000_0001_0000_1000_0000;
		end
		2 : begin
			x <= 32'b0000_0000_0100_0010_0000_0000_0000_0000;
		end
		3 : begin
			x <= 32'b1000_1000_0000_0000_0000_0000_0000_0000;
		end
		default : begin
			x <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		end
	endcase
end

always @ (posedge clock) begin
	present_state = present_state + 1;
	if(present_state == 4) begin
		present_state = 0;
	end
end
endmodule