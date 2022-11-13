module RCA
(
	input [8-1:0] A,
	input [8-1:0] B,
	input IN_Ci,
	output C_o,
	output [8-1:0] s
);


// wire s[4-1:0];
wire C_out[8-1:0];

full_adder f1(A[0],B[0],IN_Ci,s[0],C_out[0]);
full_adder f2(A[1],B[1],C_out[0],s[1],C_out[1]);
full_adder f3(A[2],B[2],C_out[1],s[2],C_out[2]);
full_adder f4(A[3],B[3],C_out[2],s[3],C_out[3]);

full_adder f5(A[4],B[4],C_out[3],s[4],C_out[4]);
full_adder f6(A[5],B[5],C_out[4],s[5],C_out[5]);
full_adder f7(A[6],B[6],C_out[5],s[6],C_out[6]);
full_adder f8(A[7],B[7],C_out[6],s[7],C_out[7]);

// assign C_o = C_out[3];

and my_and(C_o, C_out[7], 1);

endmodule




