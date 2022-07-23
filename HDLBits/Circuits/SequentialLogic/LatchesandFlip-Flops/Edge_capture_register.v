module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] temp;
    always @(posedge clk)begin
        temp<=in;
    end

    always @(posedge clk)begin
        if (reset==1)begin out<=0;end
        else begin

            // temp<=in;
            // 参考对应文件夹内的图片，
            // 如果讲此语句放在这里，当reset为1的信号传来时，
            // else这一部分的内容不会执行，所以temp内存的内容一直没有更新，
            // 所以out会出现10，明显是检测上次下降沿时的结果。
            // 所以单独将temp放在一个always中一直更新。
            // 或者说，下面的out中in由外部变量更新，
            // out则在if和else两种条件下更新，只有temp无法在else不执行的情况下更新

            out<=~in&temp|out;
        end
    end
endmodule
