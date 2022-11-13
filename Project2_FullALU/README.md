## Project checkpoint 2 FULL ALU

 - Author: Zhicheng Jiang
 - Date: 09/29/2022
 - Netid: zj78
 - Term: 2022 fall
 - Professor Rabih Younes

## Design description

I use full adder, CSA, mux, and RCA to implement a full alu for 32-bit addition, subtraction, and, or, SLL, and SRA operations. Then I have written waveform and testbench to test my design. The results show my design works very well. 

### Addition

I used three 16-bit CSA modules to implement the 32-bit addition operation(32-bit CSA), rather than using 32-bit RCA for saving time. 

In each 16-bit CSA, I used three 8-bit RCA modules. These three modules do three things at once, add low 8 bits, add high 8 bits assuming CI = 0, and add high 8 bits assuming CI = 1. Then, after the correct CI comes into 2:1 mux, it will select the right assumption. 

I use the one 16-bit CSA module to operate the low 16 bits input, and the other two 16-bit CSA modules to get the high 16 bits output. Thus, there is three 2:1 mux.

### Subtraction

In subtraction, I can use the addition module. However, I have to do bit-wise not with a single loop, and set cin to be 1. 

### AND

In the AND operation, I write a bitwise "AND" generate loop.

### OR

In the OR operation, I write a bitwise "OR" generate loop.

### Logical left-shift

In SLL, I write 32 2to1 mux for each level of the SLL module. The shift amount selects each mux. The first level stands for shifting by 1 bit or 0 bit. The second level stands for shifting by 2 bits or 0 bits. The third level stands for shifting by 4 bits or 0 bits, and so on. 

Also, I need to add another zero in the least significant bit if SLL shifts by 1 bit.

### Arithmetic right-shift

In SRA, I write 32 2to1 mux for each level of the SRA module. The shift amount selects each mux. The first level stands for shifting by 1 bit or 0 bit. The second level stands for shifting by 2 bits or 0 bits. The third level stands for shifting by 4 bits or 0 bits, and so on. 

Also, I need to add another bit that depends on the most significant bit in data_OperandsA in the most significant bit if SRA shifts by 1 bit. That is, if the most significant bit of data_OperandsA is 1, I have to add 1 in the most significant bit if SRA shifts by 1 bit. 

Likewise, if the most significant bit of data_OperandsA is 0, I have to add 0 in the most significant bit if SRA shifts by 1 bit.

## Bugs or issues

No issues or bugs right now