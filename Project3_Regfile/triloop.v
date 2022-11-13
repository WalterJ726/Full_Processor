module triloop(io_data,q,en);

	input en;
	input [31:0] q;
	inout [31:0] io_data;

	assign io_data[0] = en ? q[0] : 1'bz;
	assign io_data[1] = en ? q[1] : 1'bz;
	assign io_data[2] = en ? q[2] : 1'bz;
	assign io_data[3] = en ? q[3] : 1'bz;
	assign io_data[4] = en ? q[4] : 1'bz;
	assign io_data[5] = en ? q[5] : 1'bz;
	assign io_data[6] = en ? q[6] : 1'bz;
	assign io_data[7] = en ? q[7] : 1'bz;
	assign io_data[8] = en ? q[8] : 1'bz;
	assign io_data[9] = en ? q[9] : 1'bz;
	assign io_data[10] = en ? q[10] : 1'bz;
	assign io_data[11] = en ? q[11] : 1'bz;
	assign io_data[12] = en ? q[12] : 1'bz;
	assign io_data[13] = en ? q[13] : 1'bz;
	assign io_data[14] = en ? q[14] : 1'bz;
	assign io_data[15] = en ? q[15] : 1'bz;
	assign io_data[16] = en ? q[16] : 1'bz;
	assign io_data[17] = en ? q[17] : 1'bz;
	assign io_data[18] = en ? q[18] : 1'bz;
	assign io_data[19] = en ? q[19] : 1'bz;
	assign io_data[20] = en ? q[20] : 1'bz;
	assign io_data[21] = en ? q[21] : 1'bz;
	assign io_data[22] = en ? q[22] : 1'bz;
	assign io_data[23] = en ? q[23] : 1'bz;
	assign io_data[24] = en ? q[24] : 1'bz;
	assign io_data[25] = en ? q[25] : 1'bz;
	assign io_data[26] = en ? q[26] : 1'bz;
	assign io_data[27] = en ? q[27] : 1'bz;
	assign io_data[28] = en ? q[28] : 1'bz;
	assign io_data[29] = en ? q[29] : 1'bz;
	assign io_data[30] = en ? q[30] : 1'bz;
	assign io_data[31] = en ? q[31] : 1'bz;
	
//	assign read_data[0] = en ? q[0] : 1'bz;
//	assign read_data[1] = en ? q[1] : 1'bz;
//	assign read_data[2] = en ? q[2] : 1'bz;
//	assign read_data[3] = en ? q[3] : 1'bz;
//	assign read_data[4] = en ? q[4] : 1'bz;
//	assign read_data[5] = en ? q[5] : 1'bz;
//	assign read_data[6] = en ? q[6] : 1'bz;
//	assign read_data[7] = en ? q[7] : 1'bz;
//	assign read_data[8] = en ? q[8] : 1'bz;
//	assign read_data[9] = en ? q[9] : 1'bz;
//	assign read_data[10] = en ? q[10] : 1'bz;
//	assign read_data[11] = en ? q[11] : 1'bz;
//	assign read_data[12] = en ? q[12] : 1'bz;
//	assign read_data[13] = en ? q[13] : 1'bz;
//	assign read_data[14] = en ? q[14] : 1'bz;
//	assign read_data[15] = en ? q[15] : 1'bz;
//	assign read_data[16] = en ? q[16] : 1'bz;
//	assign read_data[17] = en ? q[17] : 1'bz;
//	assign read_data[18] = en ? q[18] : 1'bz;
//	assign read_data[19] = en ? q[19] : 1'bz;
//	assign read_data[20] = en ? q[20] : 1'bz;
//	assign read_data[21] = en ? q[21] : 1'bz;
//	assign read_data[22] = en ? q[22] : 1'bz;
//	assign read_data[23] = en ? q[23] : 1'bz;
//	assign read_data[24] = en ? q[24] : 1'bz;
//	assign read_data[25] = en ? q[25] : 1'bz;
//	assign read_data[26] = en ? q[26] : 1'bz;
//	assign read_data[27] = en ? q[27] : 1'bz;
//	assign read_data[28] = en ? q[28] : 1'bz;
//	assign read_data[29] = en ? q[29] : 1'bz;
//	assign read_data[30] = en ? q[30] : 1'bz;
//	assign read_data[31] = en ? q[31] : 1'bz;


endmodule 




//module triloop (io_data, en,q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31);
//
//
//	input en;
//	input q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31;
//	output io_data;
//	assign io_data = en ? q0 : 1'bz;
//	assign io_data = en ? q1 : 1'bz;
//	assign io_data = en ? q2 : 1'bz;
//	assign io_data = en ? q3 : 1'bz;
//	assign io_data = en ? q4 : 1'bz;
//	assign io_data = en ? q5 : 1'bz;
//	assign io_data = en ? q6 : 1'bz;
//	assign io_data = en ? q7 : 1'bz;
//	assign io_data = en ? q8 : 1'bz;
//	assign io_data = en ? q9 : 1'bz;
//	assign io_data = en ? q10 : 1'bz;
//	assign io_data = en ? q11 : 1'bz;
//	assign io_data = en ? q12 : 1'bz;
//	assign io_data = en ? q13 : 1'bz;
//	assign io_data = en ? q14 : 1'bz;
//	assign io_data = en ? q15 : 1'bz;
//	assign io_data = en ? q16 : 1'bz;
//	assign io_data = en ? q17 : 1'bz;
//	assign io_data = en ? q18 : 1'bz;
//	assign io_data = en ? q19 : 1'bz;
//	assign io_data = en ? q20 : 1'bz;
//	assign io_data = en ? q21 : 1'bz;
//	assign io_data = en ? q22 : 1'bz;
//	assign io_data = en ? q23 : 1'bz;
//	assign io_data = en ? q24 : 1'bz;
//	assign io_data = en ? q25 : 1'bz;
//	assign io_data = en ? q26 : 1'bz;
//	assign io_data = en ? q27 : 1'bz;
//	assign io_data = en ? q28 : 1'bz;
//	assign io_data = en ? q29 : 1'bz;
//	assign io_data = en ? q30 : 1'bz;
//	assign io_data = en ? q31 : 1'bz;
//	
//	assign data_readReg = io_data;
////	assign data_readReg = en ? q0 : 1'bz;
////	assign data_readReg = en ? q1 : 1'bz;
////	assign data_readReg = en ? q2 : 1'bz;
////	assign data_readReg = en ? q3 : 1'bz;
////	assign data_readReg = en ? q4 : 1'bz;
////	assign data_readReg = en ? q5 : 1'bz;
////	assign data_readReg = en ? q6 : 1'bz;
////	assign data_readReg = en ? q7 : 1'bz;
////	assign data_readReg = en ? q8 : 1'bz;
////	assign data_readReg = en ? q9 : 1'bz;
////	assign data_readReg = en ? q10 : 1'bz;
////	assign data_readReg = en ? q11 : 1'bz;
////	assign data_readReg = en ? q12 : 1'bz;
////	assign data_readReg = en ? q13 : 1'bz;
////	assign data_readReg = en ? q14 : 1'bz;
////	assign data_readReg = en ? q15 : 1'bz;
////	assign data_readReg = en ? q16 : 1'bz;
////	assign data_readReg = en ? q17 : 1'bz;
////	assign data_readReg = en ? q18 : 1'bz;
////	assign data_readReg = en ? q19 : 1'bz;
////	assign data_readReg = en ? q20 : 1'bz;
////	assign data_readReg = en ? q21 : 1'bz;
////	assign data_readReg = en ? q22 : 1'bz;
////	assign data_readReg = en ? q23 : 1'bz;
////	assign data_readReg = en ? q24 : 1'bz;
////	assign data_readReg = en ? q25 : 1'bz;
////	assign data_readReg = en ? q26 : 1'bz;
////	assign data_readReg = en ? q27 : 1'bz;
////	assign data_readReg = en ? q28 : 1'bz;
////	assign data_readReg = en ? q29 : 1'bz;
////	assign data_readReg = en ? q30 : 1'bz;
////	assign data_readReg = en ? q31 : 1'bz;
//
//	
//endmodule 