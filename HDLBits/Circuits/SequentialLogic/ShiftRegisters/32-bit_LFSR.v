module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q); 

    reg [31:0] qq;
    always @(*)begin
        qq=q[31:1];
        qq[31]=0^q[0];
        qq[21]=q[22]^q[0];
        qq[1]=q[2]^q[0];
        qq[0]=q[1]^q[0];
    end

    always @(posedge clk)begin
        if (reset)begin q<=32'h1;end
        else begin
            q<=qq;
        end
    end
endmodule
