/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */
	 
	 wire [31:0] pc_in, pc_out; 
	 wire [4:0] opcode;
	 wire [7:0] control;
	 wire isR, BR, JP, ALUinB, ALUop, DMwe, Rwe, Rdst,Rwd;
	 wire [4:0] ALUOP;
	 wire [4:0] rd;
	 wire [4:0] rs;
	 wire [4:0] rt;
	 wire [4:0] shamt;
	 wire [31:0] ALUINB;
	 wire [16:0] immediate;
	 wire [31:0] ext_immediate;
	 
	 wire [31:0] Res_ALU;
	 wire inNotEqual,isLessThan,overflow,temp;
	 // PC fetch
	 pc my_pc(pc_out, pc_in, clock, 1'b1, reset);
	 // next instruction, pc plus + 1
	 wire [31:0] pc_next;
	 wire pc_cout, pc_overflow;
	CSA my_CSA(pc_out,32'd1,pc_next,0,pc_cout, pc_overflow);//change to 32bit CSA;
	
	
	assign pc_in = pc_next;
	 assign address_imem = pc_out[11:0];
	 
	 // Decode
	 and (isR, ~q_imem[31], ~q_imem[30], ~q_imem[29], ~q_imem[28], ~q_imem[27]);
	 assign opcode = q_imem[31:27];
	 assign rd = q_imem[26:22];
	 assign rs = q_imem[21:17];
	 assign rt = q_imem[16:12];
	 assign shamt = q_imem[11:7];
	 assign ALUOP = isR? q_imem[6:2]:5'd0;
	 assign immediate = q_imem[16:0];
	 extend extend1(ext_immediate,immediate);
	 
	 insn_decoder my_decoder(control, opcode, isR);
	 
	 and (BR, control[7], 1'b1);
	and (JP, control[6], 1'b1);
	and (ALUinB, control[5], 1'b1);
	and (ALUop, control[4], 1'b1);
	and (DMwe, control[3], 1'b1);
	and (Rwe, control[2], 1'b1);
	and (Rdst, control[1], 1'b1);
	and (Rwd, control[0], 1'b1);
	
	 // operand fetch
	 //assign ctrl_writeEnable =Rwe; 
	 assign ctrl_writeEnable = opcode==0 ||opcode==5 || opcode==8;
	 assign ctrl_readRegA = rs;
	 assign ctrl_readRegB = (opcode==5'b00111) ? rd : rt;
	 // execute
	 assign ALUINB = isR ? data_readRegB : ext_immediate;
	 
	 alu alu1(data_readRegA,ALUINB,ALUOP,shamt,Res_ALU,inNotEqual,isLessThan,temp);
	 assign overflow=(((ALUOP==5'b00000 ||ALUOP==5'b00001)&& isR)||opcode==3)? temp:0;
	 
	 // result store
	 wire [31:0] rstatus_value;
	 assign rstatus_value = opcode == 5'b00101 ? 2 : (ALUOP == 5'b00000 ? 1 : 3);
	 assign address_dmem = Res_ALU[11:0];
    assign data = data_readRegB;
	 assign wren = DMwe;
	 assign data_writeReg = Rwd ? q_dmem : overflow ? (rstatus_value): Res_ALU;
	 assign ctrl_writeReg= overflow ? 5'b11110 : rd;
	 
	 // ??? reset status

endmodule