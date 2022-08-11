// 多级延迟触发器
`timescale 1ns/1ns;
module DFF_N #(parameter N=3) (
    input clk,
    input reset,
    input [N-1:0] D,
    output reg [N-1:0] d0,
    output reg [N-1:0] d1,
    output reg [N-1:0] Q
); 
    
    always @(posedge clk or negedge reset)
        if (~reset) begin
            d0 <= 0;
            d1 <= 0;
            Q <= 0;
        end
        else begin
            d0<=D;
            d1<=d0;
            Q<=d1;
        end
endmodule

module DFF_N_tb;
    reg clk, rstn;
    reg [2:0] D;
    wire [2:0] d0;
    wire [2:0] d1;
    wire [2:0] Q;

    initial clk = 1;
    always #5 clk = ~clk;
    initial begin
        D = 3'd0;
        rstn = 1'b1;
        #50 rstn = 1'b0;
        #50 rstn = 1'b1;
        #100 D=3'd1;
        #100 D=3'd2;
        #100 D=3'd3;
        #100 D=3'd0;
        #100 $stop;
    end

    DFF_N dff_n(
        .clk(clk),
        .reset(rstn),
        .D(D),
        .Q(Q),
        .d0(d0),
        .d1(d1)
    );
endmodule