module AND_FF(
 input input1, input2,
 output reg out);

always @ (input1, input2) begin
	out = input1 & input2;		
end	
endmodule
