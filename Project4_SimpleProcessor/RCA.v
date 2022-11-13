module RCA(in1,in2,c_in,sum,c_out,overflow);
	input [15:0] in1;
	input [15:0] in2;
	
	input c_in;
	output [15:0] sum;
	output c_out;
	output overflow;
	wire throw1,throw2,throw3;
	wire out1,out2,out3;
	
	ripple_carry_adder_4b RCA_4b_1(in1[3:0],in2[3:0],c_in,sum[3:0],out1,throw1); 
	ripple_carry_adder_4b RCA_4b_2(in1[7:4],in2[7:4],out1,sum[7:4],out2,throw2); 
	ripple_carry_adder_4b RCA_4b_3(in1[11:8],in2[11:8],out2,sum[11:8],out3,throw3); 
	ripple_carry_adder_4b RCA_4b_4(in1[15:12],in2[15:12],out3,sum[15:12],c_out,overflow); 
	
endmodule
	