module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    // 一定要加上位宽
    wire [7:0] q1, q2, q3;
    my_dff8 dff8_1(.clk(clk), .d(d), .q(q1));
    my_dff8 dff8_2(.clk(clk), .d(q1), .q(q2));
    my_dff8 dff8_3(.clk(clk), .d(q2), .q(q3));

    //always@(*)
    
    //这里的begin可以不加
    always@(d or q1 or q2 or q3 or sel)//begin
        case(sel)
            2'b00:begin q=d;end
            2'b01:begin q=q1;end
            2'b10:begin q=q2;end
            2'b11:begin q=q3;end
        endcase
    //end

endmodule