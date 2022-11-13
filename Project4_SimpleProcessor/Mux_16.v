module Mux_16(in1,in2,S,out);
	input [15:0] in1;
	input[15:0] in2;
	input S;
	output [15:0] out;
	
	wire not_S;
	not not1(not_S, S);
	
	wire [15:0] and_result_1;
	wire [15:0] and_result_2;
	
	and and0(and_result_1[0],in1[0],not_S);
	and and1(and_result_1[1],in1[1],not_S);
	and and2(and_result_1[2],in1[2],not_S);
	and and3(and_result_1[3],in1[3],not_S);
	and and4(and_result_1[4],in1[4],not_S);
	and and5(and_result_1[5],in1[5],not_S);
	and and6(and_result_1[6],in1[6],not_S);
	and and7(and_result_1[7],in1[7],not_S);
	and and8(and_result_1[8],in1[8],not_S);
	and and9(and_result_1[9],in1[9],not_S);
	and and10(and_result_1[10],in1[10],not_S);
	and and11(and_result_1[11],in1[11],not_S);
	and and12(and_result_1[12],in1[12],not_S);
	and and13(and_result_1[13],in1[13],not_S);
	and and14(and_result_1[14],in1[14],not_S);
	and and15(and_result_1[15],in1[15],not_S);
	
	and and_0(and_result_2[0],in2[0],S);
	and and_1(and_result_2[1],in2[1],S);
	and and_2(and_result_2[2],in2[2],S);
	and and_3(and_result_2[3],in2[3],S);
	and and_4(and_result_2[4],in2[4],S);
	and and_5(and_result_2[5],in2[5],S);
	and and_6(and_result_2[6],in2[6],S);
	and and_7(and_result_2[7],in2[7],S);
	and and_8(and_result_2[8],in2[8],S);
	and and_9(and_result_2[9],in2[9],S);
	and and_10(and_result_2[10],in2[10],S);
	and and_11(and_result_2[11],in2[11],S);
	and and_12(and_result_2[12],in2[12],S);
	and and_13(and_result_2[13],in2[13],S);
	and and_14(and_result_2[14],in2[14],S);
	and and_15(and_result_2[15],in2[15],S);
	
	or or0(out[0],and_result_1[0],and_result_2[0]);
	or or1(out[1],and_result_1[1],and_result_2[1]);
	or or2(out[2],and_result_1[2],and_result_2[2]);
	or or3(out[3],and_result_1[3],and_result_2[3]);
	or or4(out[4],and_result_1[4],and_result_2[4]);
	or or5(out[5],and_result_1[5],and_result_2[5]);
	or or6(out[6],and_result_1[6],and_result_2[6]);
	or or7(out[7],and_result_1[7],and_result_2[7]);
	or or8(out[8],and_result_1[8],and_result_2[8]);
	or or9(out[9],and_result_1[9],and_result_2[9]);
	or or10(out[10],and_result_1[10],and_result_2[10]);
	or or11(out[11],and_result_1[11],and_result_2[11]);
	or or12(out[12],and_result_1[12],and_result_2[12]);
	or or13(out[13],and_result_1[13],and_result_2[13]);
	or or14(out[14],and_result_1[14],and_result_2[14]);
	or or15(out[15],and_result_1[15],and_result_2[15]);
	
	
	endmodule
	
	
	
	
	
	
	