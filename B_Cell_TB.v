`timescale 1ns/10ps
module B_Cell_TB;

reg x, y, c;
wire G, P, S;

B_Cell b_cell(x, y, c, G, P, S);

reg [3:0] present_state = 3'b000;
reg clock;

initial begin 
	clock = 0;
	forever #10 clock = ~clock;
end

always @ (present_state) begin
	case(present_state)
		0 : begin
			x <= 0;
			y <= 0;
			c <= 0;
		end
		1 : begin
			x <= 1;
			y <= 0;
			c <= 0;
		end
		2 : begin
			x <= 0;
			y <= 1;
			c <= 0;
		end
		3 : begin
			x <= 1;
			y <= 1;
			c <= 0;
		end
		4 : begin 
			x <= 0;
			y <= 0;
			c <= 1;
		end 
		4 : begin 
			x <= 1;
			y <= 0;
			c <= 1;
		end
		5 : begin
			x <= 0;
			y <= 1;
			c <= 1;
		end
		6 : begin
			x <= 1;
			y <= 1;
			c <= 1;
		end
		default : begin
			x <= 0;
			y <= 0;
			c <= 0;
		end
	endcase
end

always @ (posedge clock) begin
	present_state = present_state + 1;
	if (present_state == 7) begin
		present_state = 0;
	end
end
endmodule