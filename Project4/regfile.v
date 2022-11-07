module regfile(
	clock, ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg, data_readRegA,
	data_readRegB
	, reg4, reg5, reg6, reg7, reg8, reg9, reg12, reg13
	//, reg20, reg21, reg22, reg23, reg24, reg25, reg26
	//, reg27, reg28, reg29
);
	input clock, ctrl_writeEnable, ctrl_reset;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	input [31:0] data_writeReg;
	output [31:0] data_readRegA, data_readRegB;

	reg[31:0] registers[31:0];

	integer i;
	
	always @(posedge clock or posedge ctrl_reset)
	begin
		if(ctrl_reset)
			begin
				for(i = 0; i < 32; i = i + 1)
					begin
						registers[i] = 32'd0;
					end
			end
		else
			if(ctrl_writeEnable && ctrl_writeReg != 5'd0)
				registers[ctrl_writeReg] = data_writeReg;
	end
	
	assign data_readRegA = ctrl_writeEnable && (ctrl_writeReg == ctrl_readRegA) ? 32'bz : registers[ctrl_readRegA];
	assign data_readRegB = ctrl_writeEnable && (ctrl_writeReg == ctrl_readRegB) ? 32'bz : registers[ctrl_readRegB];
	
	output [31:0] reg4, reg5, reg6, reg7, reg8, reg9, reg12, reg13;
	//output [31:0] reg20, reg21, reg22, reg23, reg24, reg25, reg26
	//output [31:0] reg27, reg28, reg29;
//	assign reg1 = registers[1];
//	assign reg2 = registers[2];
//	assign reg3 = registers[3];
	assign reg4 = registers[4];
	assign reg5 = registers[5];
	assign reg6 = registers[6];
	assign reg7 = registers[7];
	assign reg8 = registers[8];
	assign reg9 = registers[9];
//	assign reg10 = registers[10];
//	assign reg11 = registers[11];
	assign reg12 = registers[12];
	assign reg13 = registers[13];
	
	
//	assign reg20 = registers[20];
//	assign reg21 = registers[21];
//	assign reg22 = registers[22];
//	assign reg23 = registers[23];
//	assign reg24 = registers[24];
//	assign reg25 = registers[25];
//	assign reg26 = registers[26];
	
	
//	assign reg27 = registers[27];
//	assign reg28 = registers[28];
//	assign reg29 = registers[29];
	
endmodule