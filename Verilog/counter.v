//2022-7-22 shin
//计数器；
`timescale 1ns/10ps
module counter(clk, res, y);
    input           clk;
    input           res;
    output[7:0]     y;

    reg[7:0]        y;

    //wire[7:0]       sum;//+1运算的结果
    //assign          sum=y+1;//组合逻辑部分；
    
    //触发器
    always@(posedge clk or negedge res)
    if(~res)begin
        y<=0;
    end
    else begin
        //y<=sum;
        y<=y+1;
    end

endmodule

// testbench
module counter_tb;
    reg             clk,res;
    wire[7:0]       y;

    counter counter(.clk(clk), .res(res), .y(y));

    initial begin
        #0000       clk<=0; res<=0;
        #0017       res<=1;
        #6000       $stop;
    end

    always #5 clk<=~clk; // 形成时钟

endmodule