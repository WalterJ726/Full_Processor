module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	
	// adder
	wire [31:0] add_ans;
	wire add_overflow;
	CSA my_add(add_ans,add_overflow, data_operandA, data_operandB,1'b0);
	
	// subtractor
	wire [31:0] sub_ans;
	wire [31:0] not_data_operandB;
	wire sub_overflow;
	// Generate the bit-wise not with a single loop
	genvar i; 
	generate for (i=0; i<=31; i=i+1) begin: not_loop 
	not g1 (not_data_operandB[i], data_operandB[i]); 
	end //end of the for loop inside the generate block 
	endgenerate //end of the generate block
	
	CSA my_sub(sub_ans,sub_overflow, data_operandA, not_data_operandB, 1'b1);
	

	assign data_result = ctrl_ALUopcode ? sub_ans : add_ans; // 1: subtract
	assign overflow = ctrl_ALUopcode ? sub_overflow : add_overflow;
	

endmodule

