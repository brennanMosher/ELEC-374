`timescale 1ns/10ps
module MUL_TB_LAB;
 // Out signals for simulation (ENCODER)
 reg R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
 reg HIout, LOout, Zhighout, Zlowout, PCout, MDRout, In_Portout, Cout;

 // In signals for simulation (MULTIPLEXER)
 reg R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in; 
 reg PCin, Yin, Zlow_in, Zhigh_in, MARin, HIin, LOin, IRin, MDRin, incPC;
 
 reg [11:0] ALUin;
 // Input for MDR
 reg [31:0] Mdatain;
 reg MDRread;
 
 // Clock input
 reg clock, clr;
 
 // List of states
 parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
			 Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111,
			 T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1101;
 
 // Set present state to the default state of 0000 
 reg [3:0] Present_state = Default;
 
 // Instantiate the Bus data path
 bus BUS_TB(R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
 		      HIout, LOout, Zhighout, Zlowout, PCout, MDRout, In_Portout, Cout,
		      R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
		      PCin, Yin, Zlow_in, Zhigh_in, MARin, HIin, LOin, IRin, MDRin, ALUin, incPC, Mdatain, MDRread, clock, clr);
 
 //Clock setup
 initial begin
  clock = 0;
  clr = 0;
  forever #10 clock = ~ clock;
 end

// Change present state on every positive clock edge
always @(posedge clock) begin
 case (Present_state)
	Default : Present_state = Reg_load1a;
	Reg_load1a : Present_state = Reg_load1b;
	Reg_load1b : Present_state = Reg_load2a;
	Reg_load2a : Present_state = Reg_load2b;
	Reg_load2b : Present_state = Reg_load3a;
	Reg_load3a : Present_state = Reg_load3b;
	Reg_load3b : Present_state = T0;
	T0 : Present_state = T1;
	T1 : Present_state = T2;
	T2 : Present_state = T3;
	T3 : Present_state = T4;
	T4 : Present_state = T5;
	T5 : Present_state = T6;
 endcase
 end

always @(Present_state) begin
 case (Present_state) // assert the required signals in each clock cycle
	Default: begin
		R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0;
		R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0;
		R8out <= 0; R9out <= 0; R10out <= 0; R11out <= 0;
		R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0;
		HIout <= 0; LOout <= 0; Zhighout <= 0; Zlowout <= 0; 
		PCout <= 0; MDRout <= 0; In_Portout <= 0; Cout <= 0;
		R0in <= 0; R1in <= 0; R2in <= 0; R3in <= 0;
		R4in <= 0; R5in <= 0; R6in <= 0; R7in <= 0;
		R8in <= 0; R9in <= 0; R10in <= 0; R11in <= 0;
		R12in <= 0; R13in <= 0; R14in <= 0; R15in <= 0;
		PCin <= 0; Yin <= 0; Zlow_in <= 0; Zhigh_in <= 0; 
		MARin <= 0; HIin <= 0; LOin <= 0; IRin <= 0; incPC <= 0; 
		MDRin <= 0; ALUin <= 12'd0; Mdatain <= 32'd0; MDRread <= 0;
	end
	Reg_load1a: begin
		//Load data into MDR to move into R2
		Mdatain <= 32'h00000022;
		MDRread <= 1; 
		MDRin <= 1;
	end
	Reg_load1b: begin
		MDRread <= 0; 
		MDRin <= 0;
		//Load into R2
		MDRout <= 1; 
		R2in <= 1;
	end
	Reg_load2a: begin
		MDRout <= 0;
		R2in <= 0;	
		//Load data into MDR again
		Mdatain <= 32'h00000024;
		MDRread <= 1; 
		MDRin <= 1;
	end
	Reg_load2b: begin
		MDRread <= 0; 
		MDRin <= 0;
		//Place data in R4
		MDRout <= 1; 
		R4in <= 1;
	end
	T0: begin 
		MDRout <= 0;
		R4in <= 0;
		// PC onto bus
		PCout <= 1; 
		// MAR takes value from bus
		MARin <= 1; 
		// Increment the value of PC
		// Signal to tell ALU to increment the PC value
		// Use buxmuxOut to increment PC
		incPC <= 1; 
		// Put into zlow
		Zlow_in <= 1;
	end
	T1: begin
		PCout <= 0;
		MARin <= 0;
		incPC <= 0; 
		Zlow_in <= 0;
		// Put output of PC increment on bus then back into PC
		Zlowout <= 1; 
		PCin <= 1; 
		// Put Mdatain into the MDR register
		MDRread <= 1; MDRin <= 1; Mdatain <= 32'h4A920000; // opcode for “and R5, R2, R4”
	end
	T2: begin
		Zlowout <= 0; 
		PCin <= 0; 
		MDRread <= 0; MDRin <= 0;
		//Put MDR value into IR
		MDRout <= 1; IRin <= 1;
	end
	T3: begin
		MDRout <= 0; IRin <= 0;
		//Put value in R2 onto the bus
		R2out <= 1; 
		// Put that value into Y register
		Yin <= 1;
	end
	T4: begin
		R2out <= 0; 
		Yin <= 0;
		// Put value in R4 onto the bus
		R4out <= 1; 
		//Send signal for and logic
		ALUin <= 12'b0000_0010_0000; 
		// Put it into the Z register
		Zhigh_in <= 1;
		Zlow_in <= 1;
	end
	T5: begin
		R4out <= 0; 
		ALUin <= 12'b0000_0000_0000; 
		Zhigh_in <= 0;
		Zlow_in <= 0;
		// Put the value of Zlow onto the bus
		Zlowout <= 1; 
		// Put that value in LO
		LOin <= 1;
	end
	T6: begin
		Zlowout <= 0;
		LOin <= 0;
		Zhighout <= 1;
		HIin <= 1;
	end
 endcase
end
endmodule 

