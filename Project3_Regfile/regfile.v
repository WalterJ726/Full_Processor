module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	// write
	wire [32*32-1:0] q;
	reg_write my_write(q,clock,ctrl_writeEnable,ctrl_reset,ctrl_writeReg,data_writeReg);
	
	// read
	reg_read my_readA(data_readRegA,ctrl_readRegA,q,clock,ctrl_reset);
	reg_read my_readB(data_readRegB,ctrl_readRegB,q,clock,ctrl_reset);
	

endmodule
