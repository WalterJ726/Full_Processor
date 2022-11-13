module bitwise_and(out,in0,in1);
	input [31:0] in0;
	input [31:0] in1;
	output [31:0] out;
	
	
	genvar i; 
	generate for (i=0; i<=31; i=i+1) begin: and_loop 
	and g1 (out[i],in0[i],in1[i]); 
	end //end of the for loop inside the generate block 
	endgenerate //end of the generate block
	
endmodule 	