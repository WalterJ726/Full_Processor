module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

	
	// adder
	wire [31:0] add_ans;
	wire add_overflow,add_isNotEqual, add_isLessThan;
	CSA my_add(add_ans,add_overflow, add_isNotEqual,add_isLessThan, data_operandA, data_operandB,1'b0);
	
	// subtractor
	wire [31:0] sub_ans;
	wire [31:0] not_data_operandB;
	wire sub_overflow,sub_isNotEqual,sub_isLessThan;
	//wire temp_sub_isLessThan;
	// Generate the bit-wise not with a single loop
	genvar i; 
	generate for (i=0; i<=31; i=i+1) begin: not_loop 
	not g1 (not_data_operandB[i], data_operandB[i]); 
	end //end of the for loop inside the generate block 
	endgenerate //end of the generate block
	CSA my_sub(sub_ans,sub_overflow, sub_isNotEqual,sub_isLessThan, data_operandA, not_data_operandB, 1'b1);
	
	
	// And
	wire [31:0] and_ans;
	bitwise_and my_and(and_ans,data_operandA,data_operandB);
	
	// Or
	wire [31:0] or_ans;
	bitwise_or my_or(or_ans,data_operandA,data_operandB);
	
	// leftshift
	wire[31:0] leftshift_ans;
	sll my_sll(leftshift_ans,data_operandA,ctrl_shiftamt);
	
	
	// rightshift
	wire[31:0] rightshift_ans;
	sra my_sra(rightshift_ans,data_operandA,ctrl_shiftamt);
	
	
	mux6_to_1 my_mux(data_result,add_ans,sub_ans,and_ans,or_ans,leftshift_ans,rightshift_ans,ctrl_ALUopcode);
	assign overflow = ctrl_ALUopcode ? sub_overflow : add_overflow;
	assign isNotEqual = ctrl_ALUopcode ? sub_isNotEqual : add_isNotEqual;
	assign isLessThan = ctrl_ALUopcode ? sub_isLessThan : add_isLessThan;
	
	
endmodule 

