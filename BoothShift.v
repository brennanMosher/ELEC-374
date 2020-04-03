module BoothShift (
 input [63:0] x, y,
 output reg [31:0] Zlow, Zhigh);
 
 reg [63:0] shiftTemp;
 reg [4:0] i;

always @ (x or y) begin
	// assign the input y register to the temporary variable for the shift operation
	shiftTemp <= y;
	// loop through and perform a single bit shift x number of times
	for (i=0; i<x; i = i+1) begin 
		// assign the most significant 63 bits to the least significant 63 bits in the temporary register
		shiftTemp[62:0] <= shiftTemp[63:1];
		// idk if we acutally need this since the above line will not overwrite this bit (i.e. sortof auto sign extends)
		shiftTemp[63] <= shiftTemp[62];
	end
	// break up the temporary register into two 32 bit numbers for output
	Zlow <= shiftTemp[31:0];
	Zhigh <= shiftTemp[63:32];
end
endmodule