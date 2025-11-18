module top_whole_tb();

    reg reset;
    reg clk;
    wire [7:0] result;
	
    top_whole dut(.clk(clk), .reset(rst), .result(result));
 
 initial begin
 
 clk = 1'b0;
 
 forever #5 clk = ~clk; 
 end
    
    initial begin
        reset = 1'b1;
        #20; //changed from #10
        reset = 1'b0;
        #15000; 
    
        $finish;
    end
endmodule
