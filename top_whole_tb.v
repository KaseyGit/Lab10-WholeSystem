module top_whole_tb();

    reg reset;
    reg clk;
    reg [2:0] addr1, addr2, dest_addr;
    wire [7:0] result;
	
    top_whole dut(.clk(clk), .rst(reset), .addr1(addr1), .addr2(addr2), .dest_addr(dest_addr), .result(result));
 
 initial begin
 
 clk = 1'b0;
 
 forever #5 clk = ~clk; 
 end
 
//rom contents:
//3'd0: data_out = 4'b0;
//3'd1: data_out = 4'b1100;
//3'd2: data_out = 4'b0110;
//3'd3: data_out = 4'b0111;
//3'd4: data_out = 4'b1000;
//3'd5: data_out = 4'b0001;
//3'd6: data_out = 4'b1101;
//3'd7: data_out = 4'b1110;
    
    initial begin
        reset = 1'b1;
        #20; //changed from #10
        reset = 1'b0;
        #10;
        
        addr1 = 3'd4; //value of 8 in rom
        addr2 = 3'd5; //value of 1 in rom
        dest_addr = 3'd0;
        #50;
        
        reset = 1'b1;
        #50;
        
        reset = 1'b0;
        addr1 = 3'd1; //12 in rom
        addr2 = 3'd3; //7 in rom
        dest_addr = 3'd1;
        #50;
        
        reset = 1'b1;
        #5;
    
        $finish;
    end
endmodule
