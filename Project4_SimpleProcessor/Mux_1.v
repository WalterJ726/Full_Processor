module Mux_1(in1,in2,S,out);
	input in1;
	input in2;
	input S;
	output out;
	wire r1;
	wire r2;
	
	wire Not_S;
	not not1(Not_S,S);
	and and1(r1,in1,Not_S);
	and and2(r2,in2,S);
	
	or or1(out,r1,r2);
	endmodule
	