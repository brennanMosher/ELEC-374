module bus(
 // Encoder inputs
 input HIout, LOout, Zhighout, Zlowout, PCout, MDRout, In_Portout, Cout,
 
 // Input from Phase 3
 input BAout, Gra, Grb, Grc, Rin, Rout,
 
 // Register enable inputs
 input PCin, Yin, Zlow_in, Zhigh_in, MAR_in, HIin, LOin, IRin, MDRin,
 
 // Control signals for ALU
 input [11:0] ALUin,
 input incPC,
 
 // Input for MDR
 input [31:0] Mdatain,
 input MDRread,
 
 // Clock input
 input clock, clr);
 
 wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in;
 wire  R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
 
 // Output of multiplexer
 wire [31:0] busMuxOut;
 //Output of encoder
 wire [4:0] S;
 
 reg [31:0] IRout;
 
 // Reg to connect back to bus from registers
 wire [31:0] busMuxIn_R0in, busMuxIn_R1in, busMuxIn_R2in, busMuxIn_R3in, busMuxIn_R4in, busMuxIn_R5in, busMuxIn_R6in, busMuxIn_R7in, busMuxIn_R8in, 
			busMuxIn_R9in, busMuxIn_R10in, busMuxIn_R11in, busMuxIn_R12in, busMuxIn_R13in, busMuxIn_R14in, busMuxIn_R15in, busMuxIn_HIin, 
			busMuxIn_LOin, busMuxIn_Zhighin, busMuxIn_Zlowin, busMuxIn_PCin, busMuxIn_MDRin, busMuxIn_In_Portin, busMuxIn_C_sign_extended; 
			
 // Wire to connect y to z for now
 // Change to connect to ALU later
 wire [31:0] temp_Y, ALU_zhigh, ALU_zlow;
 // Temp location to store MAR
 wire [31:0] temp_MAR;
 
 // Temp to hold output of the datapath
 wire [31:0] output_port;
 // Temp wire to input from outside system
 wire [31:0] input_port;
 
 BusMux busMux(R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,HIout, LOout, Zhighout, Zlowout, PCout, MDRout, 
					In_Portout, Cout, busMuxIn_R0in, busMuxIn_R1in, busMuxIn_R2in, busMuxIn_R3in, busMuxIn_R4in, busMuxIn_R5in, busMuxIn_R6in, busMuxIn_R7in, busMuxIn_R8in, 
				   busMuxIn_R9in, busMuxIn_R10in, busMuxIn_R11in, busMuxIn_R12in, busMuxIn_R13in, busMuxIn_R14in, busMuxIn_R15in, busMuxIn_HIin, 
				   busMuxIn_LOin, busMuxIn_Zhighin, busMuxIn_Zlowin, busMuxIn_PCin, busMuxIn_MDRin, busMuxIn_In_Portin, busMuxIn_C_sign_extended, busMuxOut);
 
 
 // Signal is always being driven to every register
 // The R0in signal from control tells the output of the bus where to place the value
 
 // Declare R# registers
 R0 R0_reg (clr, clock, R0in, BAout, busMuxOut, busMuxIn_R0in);
 Register R1 (clr, clock, R1in, busMuxOut, busMuxIn_R1in);
 Register R2 (clr, clock, R2in, busMuxOut, busMuxIn_R2in);
 Register R3 (clr, clock, R3in, busMuxOut, busMuxIn_R3in);
 Register R4 (clr, clock, R4in, busMuxOut, busMuxIn_R4in);
 Register R5 (clr, clock, R5in, busMuxOut, busMuxIn_R5in);
 Register R6 (clr, clock, R6in, busMuxOut, busMuxIn_R6in);
 Register R7 (clr, clock, R7in, busMuxOut, busMuxIn_R7in);
 Register R8 (clr, clock, R8in, busMuxOut, busMuxIn_R8in);
 Register R9 (clr, clock, R9in, busMuxOut, busMuxIn_R9in);
 Register R10 (clr, clock, R10in, busMuxOut, busMuxIn_R10in);
 Register R11 (clr, clock, R11in, busMuxOut, busMuxIn_R11in);
 Register R12 (clr, clock, R12in, busMuxOut, busMuxIn_R12in);
 Register R13 (clr, clock, R13in, busMuxOut, busMuxIn_R13in);
 Register R14 (clr, clock, R14in, busMuxOut, busMuxIn_R14in);
 Register R15 (clr, clock, R15in, busMuxOut, busMuxIn_R15in);
 // Other registers
 Register PC (clr, clock, PCin, buxMuxOut, busMuxIn_PCin);
 IR IR_reg (clr, clk, IRin, BusMuxOut, Gra, Grb, Grc, Rin, Rout, BAout, C_sign_extended, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
			   R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,);
 Register Y (clr, clock, Yin, busMuxOut, temp_Y);
 Register Zlow(clr, clock, Zlow_in, ALU_zlow, busMuxIn_Zlowin);
 Register Zhigh(clr, clock, Zhigh_in, ALU_zhigh, busMuxIn_Zhighin);
 Register MAR(clr, clock, MAR_in, busMuxOut, temp_MAR);
 Register HI(clr, clock, HIin, busMuxOut, busMuxIn_HIin);
 Register LO(clr, clock, LOin, busMuxOut, busMuxIn_LOin);
 // MDR Register
 MDR mdr(busMuxOut, Mdatain, MDRread, clr, clock, MDRin, busMuxIn_MDRin);
 
 // Output port
 Outport out(busMuxOut, clr, clk, In_Portout, output_port);
 // Input port
 Inport in(input_port, clr, clk, busMuxIn_In_Portin);
 
 
 // ALUin decides which ALU operation is used
 ALU ALU_LOGIC(incPC, ALUin, temp_Y, busMuxOut, ALU_zlow, ALU_zhigh);
 
 
endmodule
 
 
 
