module serial2parallel(
    input clk,
    input rst_n,
    input data_valid_i,
    input data_in,  // 1位输入
    output reg data_valid_o,
    output reg [7:0] data_out // 8位并行输出
); 

    always @(posedge clk or negedge rst_n) begin
        if (rst_n == 1'b0)
            data_out <= 8'b0;
        else if (data_valid_i == 1'b1) begin
            data_out <= {data_out[6:0], data_in}; // 低位先赋值
            // data_out <= {data_in, data_out[7:1]}; // 高位先赋值
            data_valid_o <= 1'b1;
        end
        else begin
            data_valid_o <= 1'b0;
            data_out <= data_out;
        end
    end
endmodule

`timescale 1ns/1ps
module serial2parallel_tb;
    parameter PERIOD = 10;
    reg clk = 0;
    reg rst_n = 0;
    reg data_valid_i = 0;
    reg data_in = 0;

    wire data_valid_o;
    wire [7:0] data_out;

    initial begin
        forever #(PERIOD/2) clk=~clk;
    end

    initial begin
        #(PERIOD*2) rst_n = 1;
    end

    serial2parallel u_serial2parallel(
        .clk(clk),
        .rst_n(rst_n),
        .data_valid_i(data_valid_i),
        .data_in(data_in),
        .data_valid_o(data_valid_o),
        .data_out(data_out[7:0])
    );

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_valid_i <= 0;
            data_in <= 0;
        end
        else begin
            data_valid_i <= 1;
            data_in <= {$random} %2;
        end
    end

    initial begin
        #500 $stop;
    end

endmodule