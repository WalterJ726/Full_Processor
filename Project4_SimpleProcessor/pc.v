module pc(q,d,clk,en,clr);

	input [31:0] d;
	input clk,en,clr;
	
	output [31:0] q;

	genvar i; 
	generate for (i=0; i<=31; i=i+1) begin: dffe_loop 
	dffe_ref my_dffe(q[i],d[i],clk,en,clr);
	end //end of the for loop inside the generate block 
	endgenerate //end of the generate block

endmodule 
