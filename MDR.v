module MDR(
 input [31:0] busMuxOut, Mdatain,
 input read, clear, clk, MDRin,
 output [31:0] Q);
 
  wire [31:0] connector;
  
  Multiplexer2 M(busMuxOut, Mdatain, read, connector);
  Register MDR (clear, clk, MDRin, connector, Q);
 endmodule 