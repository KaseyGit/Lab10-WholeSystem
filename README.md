This project implements a full system that can read values from Read Only Memory (ROM), store them in a register file (RF) for quick access, perform multiplication with the values, and store the product to Random Access Memory (RAM).

The system is initialized for usage with a reset signal, then accepts the addresses addr1 and addr2 from which to read ROM. These values are stored in the RF with each read, then put through a combinational multiplier. The multiplier output is stored in a set location of the RAM, dest_addr.

The addresses to read from and write to are given as external inputs to the system, and the control unit (CU) sends these addresses to the appropriate memory blocks with correct timing, modeled with a state machine.
