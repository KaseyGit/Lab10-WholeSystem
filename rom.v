//ROM FILE FROM LAB 8
module rom(
	input [2:0] addr,
	output reg [3:0] data_out);
	
	always @* begin
		//not updating with clock, so will use blocking assignments
		case (addr)
			//assign values arbitrarily and check using our testbench
			3'd0: data_out = 4'b0;
			3'd1: data_out = 4'b1100;
			3'd2: data_out = 4'b0110;
			3'd3: data_out = 4'b0111;
			3'd4: data_out = 4'b1000;
			3'd5: data_out = 4'b0001;
			3'd6: data_out = 4'b1101;
			3'd7: data_out = 4'b1110;
		endcase
	end
	
endmodule
