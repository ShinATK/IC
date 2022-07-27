`timescale 1ns/1ns
module data_select(
	input clk,
	input rst_n,
	input signed[7:0]a,
	input signed[7:0]b,
	input [1:0]select,
	output reg signed [8:0]c
);

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            c <= 0;
        end
        else begin
            case(select)
                2'b00:  c <= a;
                2'b01:  c <= b;
                2'b10:  c <= a+b;
                2'b11:  c <= a-b;
                default: c <= 0;
            endcase
        end

    end

endmodule

module testbench();

	reg signed [7:0] a,b;
	reg [1:0] select;
	reg clk;
	reg rst_n;
	wire signed [8:0]c;

    initial begin
        $dumpfile("out.vcd");
        $dumpvars(0, testbench);
    end

    initial 
        begin
            clk = 1;
            repeat(100)
                begin
                    #5 clk=~clk;
                end
        end

    data_select dut(
        .clk(clk),
        .rst_n(rst_n),
        .a(a),
        .b(b),
        .select(select),
        .c(c)
    );

    initial begin
        rst_n = 0;
        a = 8'b00000011;
        b = 8'b00000001;
        select = 2'd0;
        #10;
        rst_n = 1;
        #20;
        select = 2'd1;
        #10;
        select = 2'd1;
        #30;
        select = 2'd1;
        #30;
        #70
    end

endmodule