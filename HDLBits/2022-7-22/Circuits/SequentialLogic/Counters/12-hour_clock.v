module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    counter60 counter_s(
        .clk(clk),
        .reset(reset),
        .ena(ena),
        .tt(ss));
    counter60 counter_m(
        .clk(clk),
        .reset(reset),
        .ena(ena&(ss==8'h59)),
        .tt(mm));
    counter12 counter_h(
        .clk(clk),
        .reset(reset),
        .ena(ena&(ss==8'h59)&(mm==8'h59)),
        .tt(hh));

    always @(posedge clk)begin
        if(reset)begin pm<=0;end
        else if((hh==8'h11)&(mm==8'h59)&(ss==8'h59)) begin pm<=~pm;end
        else begin pm<=pm;end
    end

endmodule

module counter60(
    input clk,
    input reset,
    input ena,
    output reg [7:0] tt);
    always @(posedge clk)begin
        if(reset)begin
            tt<=8'h0;
        end
        else if(ena)begin
            if(tt==8'h59)begin
                tt<=0;
            end
            else if(tt[3:0]==8'h9)begin
                tt[3:0]<=8'h0;
                tt[7:4]<=tt[7:4]+1;
            end
            else begin
                tt[3:0]<=tt[3:0]+1;
            end
        end
    end
endmodule

module counter12(
    input clk,
    input reset,
    input ena,
    output reg [7:0] tt);
    always @(posedge clk)begin
        if(reset)begin
            tt<=8'h12;
        end
        else if(ena)begin
            if(tt==8'h12)begin
                tt<=8'h1;
            end
            else if(tt[3:0]==8'h9)begin
                tt[3:0]<=8'h0;
                tt[7:4]<=tt[7:4]+1;
            end
            else begin
                tt[3:0]<=tt[3:0]+1;
            end
        end
    end
endmodule
