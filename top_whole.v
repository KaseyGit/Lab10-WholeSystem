module top_whole(input clk, rst, output reg[7:0] result);

wire [3:0] D; //rom data_out
reg DA; //output from cu
reg SA; //output from cu
reg SB; //output from cu
reg W_rf; //output from cu
reg W_ram;
wire RF_A; 
wire RF_B;
reg [7:0] product; //wire or output?
reg [7:0] addr;

//control unit
cu control(.clk(clk), .reset(rst),.w_rf(W_rf), .DA(DA), .SA(SA), .SB(SB), .w_ram(W_ram));

//rom
rom rom_call(.clk(clk), .reset(rst), .rom_adr(addr), .data_out(D));

//RF
RF register_file(.A(RF_A), .B(RF_B), .SA(SA), .SB(SB), .D(D), .DA(DA), .W_rf(W), .rst(.rst), .clk(clk));

//Multiplier
combo_mult mult(.a(RF_A), .b(RF_B), .p(product));

//RAM
ram ram_call(.clk(clk), .rst(rst), .W_ram(w), .product(data_in), .adr(addr), .data_out(result));

endmodule
