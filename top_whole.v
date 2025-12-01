module top_whole(input clk,
                input rst,
                input [2:0] addr1, addr2, dest_addr,
                output [7:0] result);

    wire [3:0] D; //rom data_out
    wire DA; //output from cu
    wire SA; //output from cu
    wire SB; //output from cu
    wire W_rf; //output from cu
    wire W_ram;
    wire [3:0] RF_A, RF_B;
    wire [7:0] product; //wire or output?
    wire [2:0] rom_addr, ram_addr;
    
    //control unit
    cu control(.clk(clk), .reset(rst),.adr1(addr1), .adr2(addr2), .dest_adr(dest_addr), .w_rf(W_rf), .DA(DA), .SA(SA), .SB(SB), .w_ram(W_ram), .rom_adr(rom_addr), .ram_adr(ram_addr));
    
    //rom
    rom rom_call(.addr(rom_addr), .data_out(D));
    
    //RF
    RF register_file(.A(RF_A), .B(RF_B), .SA(SA), .SB(SB), .D(D), .DA(DA), .W(W_rf), .rst(rst), .clk(clk));
    
    //Multiplier
    combo_mult mult(.a(RF_A), .b(RF_B), .p(product));
    
    //RAM
    ram ram_call(.clk(clk), .rst(rst), .w(W_ram), .data_in(product), .addr(ram_addr), .data_out(result));

endmodule
