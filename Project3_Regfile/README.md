## Project checkpoint 3 Register File

 - Author: Zhicheng Jiang
 - Date: 10/14/2022
 - Netid: zj78
 - Term: 2022 fall
 - Professor Rabih Younes

## Design description

I use 32 1-bit dffe to design a 32-bit dffe that is a register. Then, I use 32-bit dffe to implement 32 32-bit register files.

### Write port

First, I use a decoder to select which register we want to write. Meanwhile, I need to use *and* function to *and* the output wires and the ctrl_writeEnable to select which register we actually write.

After that, we input the clock, data_writeReg, and Enable signal to each register.

### Read port

We can read 2 32-bits data at the same time. However, the read ports are in the same structure.

First, I use a decoder to select which register we want to read. Meanwhile, I need to use tri gates to get the output data. Otherwise, the wires will become a short circuit.

## Bugs or issues

No issues or bugs right now