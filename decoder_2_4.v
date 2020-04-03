module decoder_2_4(
input [1:0] x,
output [3:0] q);


reg [3:0] tempQ;
always @(x) begin
 if(x == 2'b00) begin
	tempQ = 4'b1000;
 end else if(x == 2'b01) begin
	tempQ = 4'b0100;
 end else if(x == 2'b10) begin
	tempQ = 4'b0010;
 end else if(x == 2'b11) begin
	tempQ = 4'b0001;
 end 
end 

assign q = tempQ;

endmodule 