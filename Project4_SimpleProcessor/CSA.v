module CSA(in1,in2,sum,cin,cout,overflow);
	input [31:0] in1;
	input [31:0] in2;
	input cin;
	output [31:0] sum;
	output cout;
	output overflow;
	wire temp_out0,temp_out1,temp_out2;
	wire throw1;
	wire [15:0] choice1;
	wire [15:0] choice2;
	wire overflow1,overflow2;
	RCA RCA_low(in1[15:0],in2[15:0],cin,sum[15:0],temp_out0,throw1);
	RCA RCA_high1(in1[31:16],in2[31:16],1'b0,choice1,temp_out1,overflow1);
	RCA RCA_high2(in1[31:16],in2[31:16],1'b1,choice2,temp_out2,overflow2);
	
	Mux_16 mux1(choice1,choice2,temp_out0,sum[31:16]);
	Mux_1 mux2(temp_out1,temp_out2,temp_out0,cout);
	Mux_1 mux3(overflow1,overflow2,temp_out0,overflow);
	
	endmodule
	