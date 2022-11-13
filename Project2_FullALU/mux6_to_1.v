module mux6_to_1 (out,in0,in1,in2,in3,in4,in5,s);
	output [31:0] out; // input and output should keep the same
	input [31:0] in0,in1,in2,in3,in4,in5;
	input [4:0] s;
	
	wire ns2,ns1,ns0;
	wire [31:0] y0,y1,y2,y3,y4,y5;
	wire s0,s1,s2;
	
	
	and (s0,s[0],1);
	and (s1,s[1],1);
	and (s2,s[2],1);
	not (ns2,s2);
	not (ns1,s1);
	not (ns0,s0);
	
	genvar i; 
	generate for (i=0; i<=31; i=i+1) begin: mux_loop 
	and (y0[i],in0[i],ns2,ns1,ns0);
	and (y1[i],in1[i],ns2,ns1,s0);
	and (y2[i],in2[i],ns2,s1,ns0);
	and (y3[i],in3[i],ns2,s1,s0);
	and (y4[i],in4[i],s2,ns1,ns0);
	and (y5[i],in5[i],s2,ns1,s0);
	or (out[i],y0[i],y1[i],y2[i],y3[i],y4[i],y5[i]);
	end //end of the for loop inside the generate block 
	endgenerate //end of the generate block

	

endmodule 