module RF(A, B, SA, SB, D, DA, W, rst, clk);
output [3:0]A; 
output [3:0]B; 
input SA; //source address 1
input SB; //source address 2
input [3:0] D; //data from ROM
input DA; //destination address
input W; //write enable
input rst; 
input clk;

wire[1:0] load_enable;
wire[3:0] reg1_out;
wire[3:0] reg2_out;


Decoder dec(.load_enable(load_enable), .DA(DA), .W(W));
RegisterNbit reg1(.Dout(reg1_out), .Din(D), .Load(load_enable[0]), .reset(rst), .clock(clk));
RegisterNbit reg2(.Dout(reg2_out), .Din(D), .Load(load_enable[1]), .reset(rst), .clock(clk));
Mux2to1 mux1(.Y(A),.I1(reg1_out), .I2(reg2_out), .S(SA));
Mux2to1 mux2(.Y(B),.I1(reg1_out), .I2(reg2_out), .S(SB));


//DECODER
module Decoder(output [1:0] load_enable, input DA, input W);

assign load_enable[0] = ~DA & W;
assign load_enable[1] = DA & W;

endmodule

//REGISTER
module RegisterNbit(Din, Dout, Load, reset, clock);

output reg[3:0] Dout; //register output
input [3:0] Din; //data input

input Load; //load enable
input reset; //pos logic asynch reset
input clock; //pos edge clock

always @(posedge clock or posedge reset)begin
	if(reset)
		Dout <= 0;
	else if (Load)
		Dout <= Din;
	else 
		Dout <= Dout;
	end
endmodule

module Mux2to1(Y, I1, I2, S);
    
    input [3:0] I1;
	input [3:0] I2;
    input S;
	output reg [3:0] Y;

    always @(I1, I2, S) begin
        case (S)
            1'b0: Y = I1; //register 1 data
			1'b1: Y = I2; //register 2
			default: Y = 4'b0;
        endcase
    end
   
endmodule
