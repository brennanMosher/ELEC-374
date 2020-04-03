module decoder_4_16 (
input [3:0] x,
output [15:0] q);


reg [15:0] tempQ;
always @(x) begin
 if(x == 4'b0000) begin
	tempQ = 16'b1000_0000_0000_0000;
 end else if(x == 4'b0001) begin
	tempQ = 16'b0100_0000_0000_0000;
 end else if(x == 4'b0010) begin
	tempQ = 16'b0010_0000_0000_0000;
 end else if(x == 4'b0011) begin
	tempQ = 16'b0001_0000_0000_0000;
 end else if(x == 4'b0100) begin
	tempQ = 16'b0000_1000_0000_0000;
 end else if(x == 4'b0101) begin
	tempQ = 16'b0000_0100_0000_0000;
 end else if(x == 4'b0110) begin
	tempQ = 16'b0000_0010_0000_0000;
 end else if(x == 4'b0111) begin
	tempQ = 16'b0000_0001_0000_0000;
 end else if(x == 4'b1000) begin
	tempQ = 16'b0000_0000_1000_0000;
 end else if(x == 4'b1001) begin
	tempQ = 16'b0000_0000_0100_0000;
 end else if(x == 4'b1010) begin
	tempQ = 16'b0000_0000_0010_0000;
 end else if(x == 4'b1011) begin
	tempQ = 16'b0000_0000_0001_0000;
 end else if(x == 4'b1100) begin
	tempQ = 16'b0000_0000_0000_1000;
 end else if(x == 4'b1101) begin
	tempQ = 16'b0000_0000_0000_0100;
 end else if(x == 4'b1110) begin
	tempQ = 16'b0000_0000_0000_0010;
 end else if(x == 4'b1111) begin
	tempQ = 16'b0000_0000_0000_0001;
 end else begin
	tempQ = 16'b1000_0000_0000_0000;
 end
end

assign q = tempQ;

endmodule 