module top_module(
    input clk,
    input x,
    output z
);
    wire [2:0] Q;
    initial begin z=1; end
    always @(posedge clk)begin
        Q[0]=Q[0]^x;
        Q[1]=~Q[1]&x;
        Q[2]=~Q[2]|x;
        z<=~(Q[0]|Q[1]|Q[2]);
    end
endmodule