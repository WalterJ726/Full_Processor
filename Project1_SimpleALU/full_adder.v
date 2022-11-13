module full_adder
(
	input IN_a, 
	input IN_b,
	input IN_Ci,
	output s, 
	output C_o
);

wire andab,xorab,andcab;

xor u1(xorab,IN_a,IN_b);
and u2(andab,IN_a,IN_b);
and u3(andcab,xorab,IN_Ci);

xor u4(s,xorab,IN_Ci);
or u5(C_o,andab,andcab);

endmodule
