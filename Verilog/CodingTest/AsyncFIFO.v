module fifo1
#(
    parameter DSIZE = 8,
    parameter ASIZE = 4)
(
    output [DSIZE-1:0] rdata,
    output wfull, rempty,
    input [DSIZE-1:0] wdata,
    input winc, wclk, wrst_n,
    input rinc, rclk, rrst_n,);

    wire [ASIZE-1:0] waddr, raddr;
    wire [ASIZE:0] wptr, rptr, wq2_rptr, rq2_wptr;

    sync_r2w sync_r2w (
        .wq2_rptr(wq2_rptr),
        .rptr(rptr),
        .wclk(wclk),
        .wrst_n(wrst_n));
    sync_w2r sync_w2r (
        .rq2_wptr(rq2_wptr),
        .wptr(wptr),
        .rclk(rclk),
        .rrst_n(rrst_n));


    fifomem #(DSIZE, ASIZE) fifomem(
        .rdata(rdata), .wdata(wdata),
        .raddr(raddr), .waddr(waddr),
        .wclken(winc), .wfull(wfull),
        .wclk(wclk));


    rptr_empty #(ASIZE) rptr_empty(
        .rempty(rempty),
        .raddr(raddr),
        .rptr(rptr),
        .rq2_wptr(rq2_wptr),
        .rinc(rinc), .rclk(rclk),
        .rrst_n(rrst_n));
    wptr_full #(ASIZE) wptr_full(
        .wfull(wfull), .waddr(waddr),
        .wptr(wptr), .wq2_rptr(wq2rptr),
        .winc(winc), .wclk(wclk),
        .wrst_n(wrst_n));
endmodule

module fifomem
#(
    parameter DATASIZE = 8,
    parameter ADDRSIZE = 4)
(
    output [DATASIZE-1:0] rdata,
    input [DATASIZE-1:0] wdata,
    input [DATASIZE-1:0] waddr, raddr,
    input wclken, wfull, wclk);

    localparam DEPTH = 1<<ADDRSIZE; // 将地址位数转化成FIFO深度
    reg [DATASIZE-1:0] mem [0:DEPTH-1];
    assign rdata = mem[raddr]; // 直接读，empty标志位影响raddr的累加
    always @(posedge wclk)
    if (wclken && !wfull) mem[waddr] <= wdata;
endmodule