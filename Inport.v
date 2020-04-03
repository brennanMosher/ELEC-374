module Inport(
input [31:0] inputUnit,
input clr, clk, 
output [31:0] busMuxIn_In_Portin);

reg [31:0] tempBus;
always @(posedge clk) begin
	if(clr == 1'b1) begin
		tempBus <= 0;
	end else begin
		tempBus <= inputUnit;
	end
end

assign busMuxIn_In_Portin = tempBus;

endmodule
