module insn_decoder(control, opcode, isR);

	input [4:0] opcode;
	input isR;
	output[7:0] control;
	
	wire BR, JP, ALUinB, ALUop, DMwe, Rwe, Rdst,Rwd;
	
	wire[7:0] addi, sw, lw;
	// BR
	assign BR = 0;
	
	// JP
	assign JP = 0;
	
	// ALUinB
	and (addi[2],~opcode[4], ~opcode[3], opcode[2], ~opcode[1],opcode[0]); 
	and (sw[2],~opcode[4], ~opcode[3], opcode[2], opcode[1],opcode[0]);
	and (lw[2],~opcode[4], opcode[3], ~opcode[2], ~opcode[1],~opcode[0]);
	or (ALUinB, addi[2], sw[2], lw[2]);
	
	// ALUop
	assign ALUop = 0;
	
	// DMwe
	and (sw[4],~opcode[4], ~opcode[3], opcode[2], opcode[1],opcode[0]); 
	or (DMwe, sw[4], sw[4]);

	// Rwe
	and (addi[5],~opcode[4], ~opcode[3], opcode[2], ~opcode[1],opcode[0]); 
	and (lw[5],~opcode[4], opcode[3], ~opcode[2], ~opcode[1],~opcode[0]);
	or (Rwe, addi[5], lw[5], isR);
	
	// Rdst
	assign Rdst = 0;
	
	// Rwd
	and (lw[7],~opcode[4], opcode[3], ~opcode[2], ~opcode[1],~opcode[0]);
	or (Rwd, lw[7], lw[7]);	
	
	// assign signal to control
	and (control[7],BR, 1'b1);
	and (control[6],JP, 1'b1);
	and (control[5],ALUinB, 1'b1);
	and (control[4],ALUop, 1'b1);
	and (control[3],DMwe, 1'b1);
	and (control[2],Rwe, 1'b1);
	and (control[1],Rdst, 1'b1);
	and (control[0],Rwd, 1'b1);
	
endmodule
