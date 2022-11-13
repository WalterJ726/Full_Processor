module andloop(data_readReg,read_data,en);
	input en;
	input [31:0] read_data;
	output data_readReg;

	
	and (data_readReg, read_data[0], read_data[1], read_data[2], read_data[3], read_data[4], read_data[5], read_data[6], read_data[7], read_data[8], read_data[9], read_data[10], read_data[11], read_data[12], read_data[13], read_data[14], read_data[15], read_data[16], read_data[17], read_data[18], read_data[19], read_data[20], read_data[21], read_data[22], read_data[23], read_data[24], read_data[25], read_data[26], read_data[27], read_data[28], read_data[29], read_data[30], read_data[31]);
endmodule 