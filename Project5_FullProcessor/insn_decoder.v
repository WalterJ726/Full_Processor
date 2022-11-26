module insn_decoder(opcode, isAddi, isLw, isSw,ALUinB,DMwe,setx,Rwe,blt,bne,bex,jr,jal,j);


	input [4:0] opcode;
	output isAddi, isSw, isLw;
	//output Jp;
	output ALUinB;
	output DMwe;
	output setx;
	output Rwe;
	output blt;
	output bne;
	output bex;
	output jr;
	output jal;
	output j;
	wire isR;
	
	// addi
	and (isAddi, ~opcode[4], ~opcode[3], opcode[2], ~opcode[1],opcode[0]);
	// lw
	and (isLw,~opcode[4], opcode[3], ~opcode[2], ~opcode[1],~opcode[0]);
	// sw
	and (isSw,~opcode[4], ~opcode[3], opcode[2], opcode[1],opcode[0]);
	//j T
	and and1(j,~opcode[4],~opcode[3],~opcode[2],~opcode[1],opcode[0]);
	//jal T
	and and2(jal,~opcode[4],~opcode[3],~opcode[2],opcode[1],opcode[0]);
	//JI
	//or or1(Jp,j,temp);
	//ALUinB
	or or2(ALUinB,isAddi,isLw,isSw);
	//
	assign DMwe=isSw? 1'b1:1'b0;
	//setx T
	and and3(setx, opcode[4], ~opcode[3], opcode[2], ~opcode[1],opcode[0]);
	//isR
	and and4(isR,~opcode[4],~opcode[3],~opcode[2],~opcode[1],~opcode[0]);
	or or3(Rwe,isR, isAddi,isLw,jal,setx);
	// assign Rdst=isR? 1'b1:1'b0;// have some question
	// assign Rwd=isLw? 1'b1:1'b0;
	and and5(blt, ~opcode[4],~opcode[3],opcode[2],opcode[1],~opcode[0]);
	and and6(bne, ~opcode[4],~opcode[3],~opcode[2],opcode[1],~opcode[0]);
	and and7 (jr, ~opcode[4],~opcode[3],opcode[2],~opcode[1],~opcode[0]);
	and and8(bex,opcode[4],~opcode[3],opcode[2],opcode[1],~opcode[0]);
	
	
	
endmodule
