## Project1 Simple ALU

 - Author: Zhicheng Jiang
 - Date: 09/23/2022
 - Netid: zj78
 - Term: 2022 fall
 - Professor Rabih Younes

## Design description

I use full adder, CSA, mux, and RCA to implement a simple alu for 32-bit addition and subtraction operations. Then I have written waveform and testbench to test my design. The results show my design works very well. 

### Addition

I used three 16-bit CSA modules to implement the 32-bit addition operation(32-bit CSA), rather than using 32-bit RCA for saving time. 

In each 16-bit CSA, I used three 8-bit RCA modules. These three modules do three things at once, add low 8 bits, add high 8 bits assuming CI = 0, and add high 8 bits assuming CI = 1. Then, after the correct CI comes into 2:1 mux, it will select the right assumption. 

I use the one 16-bit CSA module to operate the low 16 bits input, and the other two 16-bit CSA modules to get the high 16 bits output. Thus, there is three 2:1 mux.

### Subtraction

In subtraction, I can use the addition module. However, I have to do bit-wise not with a single loop, and set cin to be 1. 

## Bugs or issues

No issues or bugs right now