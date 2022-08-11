module p2s
(
    input               clk         ,
    input               rst_n       ,
    input       [7:0]   din         ,
    input               din_vld     ,
    output              dout
);

    reg     [7:0]       shift       ;  

    always @(posedge clk or negedge rst_n) begin  
        if(~rst_n==1)
            shift <= 8'b0;
        else if(din_vld) //将值寄存住
            shift <= din;
        else
            shift <= {1'b0, shift[7:1]}; //不断右移
    end  

    assign dout = shift[0];//不断输出
endmodule

`timescale 1ns/1ns

module p2s_tb;
    parameter PERIOD = 10;

    reg clk = 0;
    reg rst_n = 0;
    reg din_vld = 1;
    reg [7:0] data_in;

    wire data_out;

    initial begin
        forever #(PERIOD) clk=~clk;
    end

    initial begin
        forever #(PERIOD) rst_n = 1;
    end

    p2s u_p2s(
        .clk(clk),
        .rst_n(rst_n),
        .din(data_in[7:0]),
        .din_vld(din_vld),
        .dout(data_out)
    );

    initial begin
        #20 data_in = 8'b11011100;
        #20 din_vld = 0;
        #1000 $stop;
    end
endmodule