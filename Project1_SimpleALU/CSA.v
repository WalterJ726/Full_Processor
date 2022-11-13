module CSA(out,overflow,in0,in1,cin);
	input [31:0] in0;
	input [31:0] in1;
	input cin;
	
	output [31:0] out;
	output overflow;
	
	
	wire [8-1:0] sum1,sum2,sum3,sum4,sum5,sum6,sum7,sum8,sum9,sum10,sum11,sum12;
	wire [8-1:0] sum_3,sum_6,sum_9;
	wire [8-1:0] sum16_23, sum24_31;
	wire total_out;
	wire co1,co2,co3,co4,co5,co6,co7,co8,co9;
	wire ci4,ci7,ci10;

	// sum[15:0]
	RCA r1(in0[7:0],in1[7:0],cin,co1,sum1);
	RCA r2(in0[15:8],in1[15:8],0,co2,sum2); // ls==0
	RCA r3(in0[15:8],in1[15:8],1,co3,sum3); // ls==1
	
	assign sum_3 = co1 ? sum3 : sum2;  // 这里不能assign多次,不能把assign
	assign ci4 = co1 ? co3 : co2;
		
	// sum[31:16]
	
	RCA r4(in0[23:16],in1[23:16],0,co4,sum4);
	RCA r5(in0[31:24],in1[31:24],0,co5,sum5); // ls==0
	RCA r6(in0[31:24],in1[31:24],1,co6,sum6); // ls==1
	assign sum_6 = co4 ? sum6 : sum5;  
	assign ci7 = co4 ? co6 : co5;
		
	// sum[31:16]
	
	RCA r7(in0[23:16],in1[23:16],1,co7,sum7);
	RCA r8(in0[31:24],in1[31:24],0,co8,sum8); // ls==0
	RCA r9(in0[31:24],in1[31:24],1,co9,sum9); // ls==1
	
	assign sum_9 = co7 ? sum9 : sum8;  
	assign ci10 = co7 ? co9 : co8;
	
	// summary
	assign sum16_23 = ci4 ? sum7 : sum4;
	assign sum24_31 = ci4 ? sum_9 : sum_6;
	assign total_out = ci4 ? ci10 : ci7;

	
	// output[7:0]
	and myand1(out[0], sum1[0], 1);
	and myand2(out[1], sum1[1], 1);
	and myand3(out[2], sum1[2], 1);
	and myand4(out[3], sum1[3], 1);
	and myand5(out[4], sum1[4], 1);
	and myand6(out[5], sum1[5], 1);
	and myand7(out[6], sum1[6], 1);
	and myand8(out[7], sum1[7], 1);
	
	// output[15:8]
	
	and myand9(out[8], sum_3[0], 1);
	and myand10(out[9], sum_3[1], 1);
	and myand11(out[10], sum_3[2], 1);
	and myand12(out[11], sum_3[3], 1);
	and myand13(out[12], sum_3[4], 1);
	and myand14(out[13], sum_3[5], 1);
	and myand15(out[14], sum_3[6], 1);
	and myand16(out[15], sum_3[7], 1);
	
	// output[23:16]
	and myand17(out[16], sum16_23[0], 1);
	and myand18(out[17], sum16_23[1], 1);
	and myand19(out[18], sum16_23[2], 1);
	and myand20(out[19], sum16_23[3], 1);
	and myand21(out[20], sum16_23[4], 1);
	and myand22(out[21], sum16_23[5], 1);
	and myand23(out[22], sum16_23[6], 1);
	and myand24(out[23], sum16_23[7], 1);
	
	// output[31:24]
	and myand25(out[24], sum24_31[0], 1);
	and myand26(out[25], sum24_31[1], 1);
	and myand27(out[26], sum24_31[2], 1);
	and myand28(out[27], sum24_31[3], 1);	
	and myand29(out[28], sum24_31[4], 1);
	and myand30(out[29], sum24_31[5], 1);
	and myand31(out[30], sum24_31[6], 1);
	and myand32(out[31], sum24_31[7], 1);
	
	wire na,nb,nc;
	wire na_nb_c, a_b_nc;
	not (na, in0[31]);
	not (nb, in1[31]);
	not (nc, out[31]);
	and (na_nb_c,na,nb,out[31]);
	and (a_b_nc,in0[31],in1[31],nc);
	or (overflow, na_nb_c, a_b_nc);
	
endmodule 