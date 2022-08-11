module SYN_FIFO
#(
    parameter DATA_WIDTH=8;
    parameter ADDR_WIDTH=4;
    parameter DATA_DEPTH=1<<ADDR_WIDTH;
)
(
    input clk,
    input rst_n;
    input rd_en, wr_en;
    input [DATA_WIDTH-1'b1:0] data_w;
    output reg [DATA_WIDTH-1'b1:0] data_r;
    output reg [ADDR_WIDTH-1'b1:0] wr_cnt; // 更新写地址计数
    output reg [ADDR_WIDTH-1'b1:0] rd_cnt; // 更新读地址计数
    output fifo_full, fifo_empty;
    output reg [ADDR_WIDTH-1'b1:0] status_cnt; // 判断空满标志计数
);

    reg [DATA_WIDTH-1:0] data_ram;

    // 
    assign fifo_full = (status_cnt==DATA_DEPTH-1);
    assign fifo_empty = (status_cnt==0);
    // 读取使能寄存
    reg rd_en_r;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            rd_en_r <= 1'b0;
        else 
            rd_en_r <= rd_en;
    end
    // 写入数据计数器
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            wr_cnt <= 4'hf;
        else if (wr_cnt==DATA_DEPTH-1'b1)
            wr_cnt <= 0;
        else if (wr_en)
            wr_cnt <= wr_cnt+1'b1;
    end
    // 读取计数器
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            rd_cnt <= 0;
        else if (rd_cnt==DATA_DEPTH-1'b1)
            rd_cnt <= 0;
        else if (rd_en)
            rd_cnt <= rd_cnt+1'b1;
    end

    always @(posedge clk or negedge rst_n)
        if (~rst_n)
            data_r <= 4'hf;
        else if (rd_en_r)
            data_r <= data_ram;
    
    always @(posedge clk or negedge rst_n) begin
        if (rst_n==1'b0)begin
            status_cnt <= 0;
        end
        else if (rd_en && !wr_en && (status_cnt != 0)) begin
            status_cnt <= status_cnt - 1;
        end
        else if (wr_en && !rd_en && (status_cnt != DATA_DEPTH-1)) begin
            status_cnt <= status_cnt + 1;
        end
        else 
            status_cnt <= status_cnt;
    end        

    // syn_dual_Port_RAM
    integer i;
    reg [DATA_WIDTH-1:0] register [DATA_DEPTH-1:0];
    always @(posedge clk or negedge rst_n) begin
        if (rst_n == 1'b0) begin
            for (i=0; i<DATA_DEPTH; i=i+1)
                register[i] <= 0;
        end
        else if (wr_en == 1'b1)
            register[wr_cnt] <= data_w;
    end

    always @(posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0) begin
            data_ram <= 0;
        end
        else if (rd_en == 1'b1)
            data_ram <= register[rd_cnt];
        else 
            data_ram <= data_ram;
    end

endmodule