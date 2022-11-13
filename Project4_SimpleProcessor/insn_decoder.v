module insn_decoder(opcode, isAddi, isLw, isSw);


	input [4:0] opcode;
	output isAddi, isSw, isLw;
	
	// addi
	and (isAddi, ~opcode[4], ~opcode[3], opcode[2], ~opcode[1],opcode[0]);
	// lw
	and (isLw,~opcode[4], opcode[3], ~opcode[2], ~opcode[1],~opcode[0]);
	// sw
	and (isSw,~opcode[4], ~opcode[3], opcode[2], opcode[1],opcode[0]);
	
endmodule
