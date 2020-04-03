module B_Cell(
 input x, y, c,
 output reg G, P, S);
 
 // Not sure about the sensitivity list needed for this always block
 always @(x or y or c) begin
	G <= x & y;
	P <= x ^ y;
	S <= c ^ (x^y);
end 

endmodule 