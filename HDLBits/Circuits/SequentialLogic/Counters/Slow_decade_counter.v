module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always @(posedge clk)begin
        if (slowena)begin
            q<=(reset|q==9?0:q+1);
        end
        else begin
            q<=(reset?0:q);
        end
    end
endmodule
