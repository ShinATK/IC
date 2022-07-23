module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] temp;
    always @(posedge clk)begin
        temp <= in;
        pedge<= in&~temp;
        // 非阻塞赋值执行过程为：在当前仿真时间槽（timeslot）开始分析计算获得右侧表达式的值，
        // 在当前时间槽执行结束时更新左侧表达式的值，在右侧表达式分析计算和左侧表达式被更新之间，
        // 任何其他事件都可以执行，同时也有可能修改已经计算完成的右侧表达式的值，
        // 即非阻塞赋值的过程不影响其他语句的执行.
    end
endmodule