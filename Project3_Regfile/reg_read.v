module reg_read(data_readReg,ctrl_readReg,q,clock,ctrl_reset);
	// input clock;
	input [4:0] ctrl_readReg;
	input [32*32-1:0] q;
	input clock,ctrl_reset;
	output [31:0] data_readReg;

	wire [32*32-1:0] read_data;
	wire [31:0] en;
	// decoder
	
	and en0(en[0],~ctrl_readReg[4], ~ctrl_readReg[3],~ctrl_readReg[2],~ctrl_readReg[1],~ctrl_readReg[0]);
	and en1(en[1],~ctrl_readReg[4], ~ctrl_readReg[3],~ctrl_readReg[2],~ctrl_readReg[1],ctrl_readReg[0]);
	and en2(en[2],~ctrl_readReg[4], ~ctrl_readReg[3],~ctrl_readReg[2],ctrl_readReg[1],~ctrl_readReg[0]);
	and en3(en[3],~ctrl_readReg[4], ~ctrl_readReg[3],~ctrl_readReg[2],ctrl_readReg[1],ctrl_readReg[0]);
	and en4(en[4],~ctrl_readReg[4], ~ctrl_readReg[3],ctrl_readReg[2],~ctrl_readReg[1],~ctrl_readReg[0]);
	and en5(en[5],~ctrl_readReg[4], ~ctrl_readReg[3],ctrl_readReg[2],~ctrl_readReg[1],ctrl_readReg[0]);
	and en6(en[6],~ctrl_readReg[4], ~ctrl_readReg[3],ctrl_readReg[2],ctrl_readReg[1],~ctrl_readReg[0]);
	and en7(en[7],~ctrl_readReg[4], ~ctrl_readReg[3],ctrl_readReg[2],ctrl_readReg[1],ctrl_readReg[0]);
	
	and en8(en[8],~ctrl_readReg[4], ctrl_readReg[3],~ctrl_readReg[2],~ctrl_readReg[1],~ctrl_readReg[0]);
	and en9(en[9],~ctrl_readReg[4], ctrl_readReg[3],~ctrl_readReg[2],~ctrl_readReg[1],ctrl_readReg[0]);
	and en10(en[10],~ctrl_readReg[4], ctrl_readReg[3],~ctrl_readReg[2],ctrl_readReg[1],~ctrl_readReg[0]);
	and en11(en[11],~ctrl_readReg[4], ctrl_readReg[3],~ctrl_readReg[2],ctrl_readReg[1],ctrl_readReg[0]);
	and en12(en[12],~ctrl_readReg[4], ctrl_readReg[3],ctrl_readReg[2],~ctrl_readReg[1],~ctrl_readReg[0]);
	and en13(en[13],~ctrl_readReg[4], ctrl_readReg[3],ctrl_readReg[2],~ctrl_readReg[1],ctrl_readReg[0]);
	and en14(en[14],~ctrl_readReg[4], ctrl_readReg[3],ctrl_readReg[2],ctrl_readReg[1],~ctrl_readReg[0]);
	and en15(en[15],~ctrl_readReg[4], ctrl_readReg[3],ctrl_readReg[2],ctrl_readReg[1],ctrl_readReg[0]);
	
	and en16(en[16],ctrl_readReg[4], ~ctrl_readReg[3],~ctrl_readReg[2],~ctrl_readReg[1],~ctrl_readReg[0]);
	and en17(en[17],ctrl_readReg[4], ~ctrl_readReg[3],~ctrl_readReg[2],~ctrl_readReg[1],ctrl_readReg[0]);
	and en18(en[18],ctrl_readReg[4], ~ctrl_readReg[3],~ctrl_readReg[2],ctrl_readReg[1],~ctrl_readReg[0]);
	and en19(en[19],ctrl_readReg[4], ~ctrl_readReg[3],~ctrl_readReg[2],ctrl_readReg[1],ctrl_readReg[0]);
	and en20(en[20],ctrl_readReg[4], ~ctrl_readReg[3],ctrl_readReg[2],~ctrl_readReg[1],~ctrl_readReg[0]);
	and en21(en[21],ctrl_readReg[4], ~ctrl_readReg[3],ctrl_readReg[2],~ctrl_readReg[1],ctrl_readReg[0]);
	and en22(en[22],ctrl_readReg[4], ~ctrl_readReg[3],ctrl_readReg[2],ctrl_readReg[1],~ctrl_readReg[0]);
	and en23(en[23],ctrl_readReg[4], ~ctrl_readReg[3],ctrl_readReg[2],ctrl_readReg[1],ctrl_readReg[0]);
	
	and en24(en[24],ctrl_readReg[4], ctrl_readReg[3],~ctrl_readReg[2],~ctrl_readReg[1],~ctrl_readReg[0]);
	and en25(en[25],ctrl_readReg[4], ctrl_readReg[3],~ctrl_readReg[2],~ctrl_readReg[1],ctrl_readReg[0]);
	and en26(en[26],ctrl_readReg[4], ctrl_readReg[3],~ctrl_readReg[2],ctrl_readReg[1],~ctrl_readReg[0]);
	and en27(en[27],ctrl_readReg[4], ctrl_readReg[3],~ctrl_readReg[2],ctrl_readReg[1],ctrl_readReg[0]);
	and en28(en[28],ctrl_readReg[4], ctrl_readReg[3],ctrl_readReg[2],~ctrl_readReg[1],~ctrl_readReg[0]);
	and en29(en[29],ctrl_readReg[4], ctrl_readReg[3],ctrl_readReg[2],~ctrl_readReg[1],ctrl_readReg[0]);
	and en30(en[30],ctrl_readReg[4], ctrl_readReg[3],ctrl_readReg[2],ctrl_readReg[1],~ctrl_readReg[0]);
	and en31(en[31],ctrl_readReg[4], ctrl_readReg[3],ctrl_readReg[2],ctrl_readReg[1],ctrl_readReg[0]);
	
	wire [31:0] io_data;
	// output
	genvar i; 
	generate for (i=0; i<=31; i=i+1) begin: read_loop 
//		triloop my_triloop(read_data[32*(i+1)-1:0 + 32*i],q[32*(i+1)-1:0 + 32*i],en[i]);
	//triloop my_triloop(data_readReg[i],q[32*(i+1)-1:0 + 32*i],en[i]);
	// triloop my_triloop(io_data[i],en[i],q[i+32*0], q[i+32*1], q[i+32*2], q[i+32*3], q[i+32*4], q[i+32*5], q[i+32*6], q[i+32*7], q[i+32*8], q[i+32*9], q[i+32*10], q[i+32*11], q[i+32*12], q[i+32*13], q[i+32*14], q[i+32*15], q[i+32*16], q[i+32*17], q[i+32*18], q[i+32*19], q[i+32*20], q[i+32*21], q[i+32*22], q[i+32*23], q[i+32*24], q[i+32*25], q[i+32*26], q[i+32*27], q[i+32*28], q[i+32*29], q[i+32*30], q[i+32*31]);
	// dffe_ref my_dffe(data_readReg[i],io_data[i],clock,en[i], ctrl_reset);
	triloop my_triloop(io_data[31:0],q[32*(i+1)-1:0 + 32*i],en[i]);
	//my_dffe(q[i],d[i],clk,en,clr);
	end //end of the for loop inside the generate block 
	endgenerate //end of the generate block
	
	assign data_readReg = io_data;
	//and (data_readReg[i],io_data[i],1);
//	genvar j; 
//	generate for (j=0; j<=31; j=j+1) begin: and_loop 
//		andloop my_andloop(data_readReg[j],read_data[32*(j+1)-1:0 + 32*j],en[j]);
//	end //end of the for loop inside the generate block 
//	endgenerate //end of the generate block
	
endmodule 