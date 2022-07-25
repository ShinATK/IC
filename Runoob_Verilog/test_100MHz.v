`timescale 1ns/1ns
module test;

    parameter CLK_FREQ  = 100; //100MHz
    parameter CLK_CYCLE = 1e9 / (CLK_FREQ * 1e6);//switch to ns

    reg clk;
    initial clk=1'b0;//clk is initialized to "0"
    always #(CLK_CYCLE/2) clk=~clk; //generating a real clock by reversing

    always begin
        #10;
        if ($time >= 1000) begin
            $stop;
        end
    end
endmodule