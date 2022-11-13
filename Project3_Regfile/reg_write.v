module reg_write(q,clock,ctrl_writeEnable,ctrl_reset,ctrl_writeReg,data_writeReg);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg;
	input [31:0] data_writeReg;
	
	output [32*32-1:0] q;
	
	wire [31:0] en;
	// decoder:onehot 
	and en0(en[0],~ctrl_writeReg[4], ~ctrl_writeReg[3],~ctrl_writeReg[2],~ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en1(en[1],~ctrl_writeReg[4], ~ctrl_writeReg[3],~ctrl_writeReg[2],~ctrl_writeReg[1],ctrl_writeReg[0]);
	and en2(en[2],~ctrl_writeReg[4], ~ctrl_writeReg[3],~ctrl_writeReg[2],ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en3(en[3],~ctrl_writeReg[4], ~ctrl_writeReg[3],~ctrl_writeReg[2],ctrl_writeReg[1],ctrl_writeReg[0]);
	and en4(en[4],~ctrl_writeReg[4], ~ctrl_writeReg[3],ctrl_writeReg[2],~ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en5(en[5],~ctrl_writeReg[4], ~ctrl_writeReg[3],ctrl_writeReg[2],~ctrl_writeReg[1],ctrl_writeReg[0]);
	and en6(en[6],~ctrl_writeReg[4], ~ctrl_writeReg[3],ctrl_writeReg[2],ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en7(en[7],~ctrl_writeReg[4], ~ctrl_writeReg[3],ctrl_writeReg[2],ctrl_writeReg[1],ctrl_writeReg[0]);
	
	and en8(en[8],~ctrl_writeReg[4], ctrl_writeReg[3],~ctrl_writeReg[2],~ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en9(en[9],~ctrl_writeReg[4], ctrl_writeReg[3],~ctrl_writeReg[2],~ctrl_writeReg[1],ctrl_writeReg[0]);
	and en10(en[10],~ctrl_writeReg[4], ctrl_writeReg[3],~ctrl_writeReg[2],ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en11(en[11],~ctrl_writeReg[4], ctrl_writeReg[3],~ctrl_writeReg[2],ctrl_writeReg[1],ctrl_writeReg[0]);
	and en12(en[12],~ctrl_writeReg[4], ctrl_writeReg[3],ctrl_writeReg[2],~ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en13(en[13],~ctrl_writeReg[4], ctrl_writeReg[3],ctrl_writeReg[2],~ctrl_writeReg[1],ctrl_writeReg[0]);
	and en14(en[14],~ctrl_writeReg[4], ctrl_writeReg[3],ctrl_writeReg[2],ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en15(en[15],~ctrl_writeReg[4], ctrl_writeReg[3],ctrl_writeReg[2],ctrl_writeReg[1],ctrl_writeReg[0]);
	
	and en16(en[16],ctrl_writeReg[4], ~ctrl_writeReg[3],~ctrl_writeReg[2],~ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en17(en[17],ctrl_writeReg[4], ~ctrl_writeReg[3],~ctrl_writeReg[2],~ctrl_writeReg[1],ctrl_writeReg[0]);
	and en18(en[18],ctrl_writeReg[4], ~ctrl_writeReg[3],~ctrl_writeReg[2],ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en19(en[19],ctrl_writeReg[4], ~ctrl_writeReg[3],~ctrl_writeReg[2],ctrl_writeReg[1],ctrl_writeReg[0]);
	and en20(en[20],ctrl_writeReg[4], ~ctrl_writeReg[3],ctrl_writeReg[2],~ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en21(en[21],ctrl_writeReg[4], ~ctrl_writeReg[3],ctrl_writeReg[2],~ctrl_writeReg[1],ctrl_writeReg[0]);
	and en22(en[22],ctrl_writeReg[4], ~ctrl_writeReg[3],ctrl_writeReg[2],ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en23(en[23],ctrl_writeReg[4], ~ctrl_writeReg[3],ctrl_writeReg[2],ctrl_writeReg[1],ctrl_writeReg[0]);
	
	and en24(en[24],ctrl_writeReg[4], ctrl_writeReg[3],~ctrl_writeReg[2],~ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en25(en[25],ctrl_writeReg[4], ctrl_writeReg[3],~ctrl_writeReg[2],~ctrl_writeReg[1],ctrl_writeReg[0]);
	and en26(en[26],ctrl_writeReg[4], ctrl_writeReg[3],~ctrl_writeReg[2],ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en27(en[27],ctrl_writeReg[4], ctrl_writeReg[3],~ctrl_writeReg[2],ctrl_writeReg[1],ctrl_writeReg[0]);
	and en28(en[28],ctrl_writeReg[4], ctrl_writeReg[3],ctrl_writeReg[2],~ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en29(en[29],ctrl_writeReg[4], ctrl_writeReg[3],ctrl_writeReg[2],~ctrl_writeReg[1],ctrl_writeReg[0]);
	and en30(en[30],ctrl_writeReg[4], ctrl_writeReg[3],ctrl_writeReg[2],ctrl_writeReg[1],~ctrl_writeReg[0]);
	and en31(en[31],ctrl_writeReg[4], ctrl_writeReg[3],ctrl_writeReg[2],ctrl_writeReg[1],ctrl_writeReg[0]);

	
	wire [31:0] write_label;
	dffe32 my_dffe0(q[32-1:0],32'b0,clock,en[0],ctrl_reset);
	// 32bit reg
	genvar i; 
	generate for (i=1; i<=31; i=i+1) begin: dffe32_loop 
		and (write_label[i],en[i],ctrl_writeEnable);
		dffe32 my_dffe32(q[32*(i+1)-1:0 + 32*i],data_writeReg,clock,write_label[i],ctrl_reset);
	end //end of the for loop inside the generate block 
	endgenerate //end of the generate block
	
endmodule 