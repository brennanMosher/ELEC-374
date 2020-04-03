module CON_FF(
	output con_out,
	input wire [31:0] BusMuxOut,
	input wire con_in,
	input wire[3:0] decIn);

wire [3:0] decOut;
wire NOR_out;
wire NOT_out_Internal;
wire NOT_out_Bus;
wire AND_out_BRZR;
wire AND_out_BRNZ;
wire AND_out_BRPL;
wire AND_out_BRMI;
wire OR_4_out;
wire [31:0] con_outext;
wire [31:0] c_mask;

IR_Decoder IR_Decoder(.decIn(decIn), .decOut(decOut));
NOR_FF NOR_1(.in(BusMuxOut), .out(NOR_out));

NOT_FF NOT_Bus(.in(BusMuxOut[31]), .out(NOT_out_Bus));

NOT_FF NOT_Internal(.in(NOR_out), .out(NOT_out_Internal));

AND_FF AND_BRZR(decOut[0], NOR_out, AND_out_BRZR);

AND_FF AND_BRNZ(decOut[1], NOT_out_Internal, AND_out_BRNZ);

AND_FF AND_BRPL(decOut[2], NOT_out_Bus, AND_out_BRPL);

AND_FF AND_BRMI(decOut[3], BusMuxOut[31], AND_out_BRMI);

OR_4 OR_Internal(.in_1(AND_out_BRZR), .in_2(AND_out_BRNZ), .in_3(AND_out_BRPL), .in_4(AND_out_BRMI), .out(OR_4_out));

CON_DFF CON_DFF (OR_4_out, con_in, con_out); 								//this may need to always be on as per instructions
endmodule
