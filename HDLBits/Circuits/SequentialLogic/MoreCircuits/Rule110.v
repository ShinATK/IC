module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q); 


    reg [511:0] q_L, q_R;
    assign q_L={1'b0, q[511:1]};
    assign q_R={q[510:0], 1'b0};
    always@(posedge clk)begin
        if (load)begin
            q<=data;
        end
        else begin
            q<=q&(~q_L|~q_R)|(~q_L|~q)&q_R;
        end
    end

endmodule
