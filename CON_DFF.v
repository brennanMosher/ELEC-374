module CON_DFF(
 input wire data, con_in,
 output reg Q);

always @ (posedge con_in)begin
	#5 Q <= data;	
end
endmodule
