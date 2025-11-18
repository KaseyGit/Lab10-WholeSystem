//ram from lab8
module ram(
	input clk, rst, w,
	input [data_width-1:0] data_in,
	input [addr_width-1:0] addr, //can create 8 locations
	output reg [data_width-1:0] data_out);
	
	//some parameters to make more adaptable
	parameter data_width = 8;
	parameter addr_width = 3;
	parameter size = 8;
	
	//reg {data width = 8} {name} {locations = 8} --> 8-bit width data in 8 locations
	reg [data_width-1:0] mem [size-1:0];
	
	always @ (posedge clk) begin
		if (rst) begin
			//make all memory 0
			mem[0] <= 8'b0;
			mem[1] <= 8'b0;
			mem[2] <= 8'b0;
			mem[3] <= 8'b0;
			mem[4] <= 8'b0;
			mem[5] <= 8'b0;
			mem[6] <= 8'b0;
			mem[7] <= 8'b0;
			// mem[7:0] <= 64'b0; //does this work?
			// could also use a for loop
		end
		else begin
			//mem read or write
			if (w) begin
				//mem write
				mem[addr] <= data_in;
			end
			else begin
				//mem read
				data_out <= mem[addr];
			end
		end
	end
	
endmodule
