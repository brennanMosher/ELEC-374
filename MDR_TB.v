`timescale 1ns/10ps
module MDR_TB;
reg [31:0] busMuxOut, Mdatain;
reg read, clear, clock, MDRin;
wire [31:0] Q;

MDR MDR_unit(busMuxOut, Mdatain, read, clear, clock, MDRin, Q);
 
reg present_state = 3'b000;

initial begin 
	busMuxOut = 1;
	Mdatain = 2;
	clock = 0;
	forever #10 clock = ~clock;
end

always @(present_state)
begin
	case (present_state)
		0 : begin
			read <= 0;
			clear <= 0;
			MDRin <= 0;
		end
		1 : begin 
			read <= 1;
			clear <= 0;
			MDRin <= 0;
		end
		2 : begin 
			read <= 0;
			clear <= 1;
			MDRin <= 0;
		end
		3 : begin 
			read <= 1;
			clear <= 1;
			MDRin <= 0;
		end
		4 : begin
			read <= 0;
			clear <= 0;
			MDRin <= 1;
		end
		5 : begin
			read <= 1;
			clear <= 0;
			MDRin <= 1;
		end
		6 : begin 
			read <= 0;
			clear <= 1;
			MDRin <= 1;
		end
		7 : begin
			read <= 1;
			clear <= 1;
			MDRin <= 1;
		end
		default : begin
			read <= 0;
			clear <= 0;
			MDRin <= 0;
		end
	endcase 
end

always @(posedge clock) begin
	present_state = present_state + 1;
	if (present_state == 8) begin
		present_state = 0;
	end
end
endmodule

	