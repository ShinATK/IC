module FIFO_sync(
            clk,
            rst,
            w_en,
            r_en,
            data_in,
            data_out,
            count,
            full,
            empty);
    parameter FIFO_data_size = 3;
    parameter FIFO_addr_size = 2;

    input clk, rst;
    input w_en, r_en;
    input [FIFO_data_size-1:0] data_in;
    output [FIFO_data_size-1:0] data_out;
    output full, empty;
    output [FIFO_addr_size:0] count;

    reg [FIFO_data_size-1:0] data_out;
    reg [FIFO_data_size:0] count;
    reg [FIFO_data_size-1:0] w_addr, r_addr;
    reg [FIFO_data_size-1:0] mem [{FIFO_addr_size{1'b1}}:0];
    integer i;

    // memory 的初始化以
    // 写操作
    always @(posedge clk or negedge rst)
        begin
            if (!rst) begin
                w_addr <= 0;
                for (i=0; i<={FIFO_addr_size{1'b1}}; i=i+1)
                    mem[i] <= {FIFO_data_size{1'b0}};
            end
            else if (w_en&(~full)) begin
                mem[w_addr] <= data_in;
                w_addr <= w_addr+1;
            end
        end

    // 读操作
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            data_out <= {(FIFO_data_size-1){1'b0}};
            r_addr <= 0;
        end
        else if (r_en&(~empty)) begin
            data_out <= mem[r_addr];
            r_addr <= r_addr+1;
        end
    end

    // count 产生空满标志
    always @(posedge clk or negedge rst) begin
        if (!rst)
            count <= 0;
        else if (((w_en)&(~full)) & (~((r_en)&(~empty))))
            count <= count+1;
        else if (((r_en)&(~empty)) & (~((w_en)&(~full))))
            count <= count-1;
    end

    assign empty = (count==0);
    assign full = (count=={FIFO_addr_size{1'b1}}+1);
endmodule

`timescale 1ns/1ns
module FIFO_sync_top;
    reg clk, rst, w_en, r_en;
    reg [2:0] data_in;

    wire [2:0] count;
    wire [2:0] data_out;

    reg [2:0] i;

    initial begin
        clk = 0;
        rst = 1;
        data_in = 3'b000;
        w_en = 0;
        r_en = 0;

        #25     rst=0;
        #50     rst=1;
        #25     w_en=1;
        #100    r_en=1;
        #100    w_en=0;
                r_en=0;
        #100    w_en=1;
        #400    r_en=1;

        #100    $stop;
    end

    initial begin
        for (i=0;i<=50;i=i+1)
            #100 data_in=i;
    end

    always #50 clk=~clk;

    FIFO_sync #(.FIFO_data_size(3),.FIFO_addr_size(2)) ut(
                    .clk(clk),
                    .rst(rst),
                    .data_in(data_in),
                    .data_out(data_out),
                    .w_en(w_en),
                    .r_en(r_en),
                    .count(count),
                    .full(full),
                    .empty(empty)
    );
endmodule