`timescale 1ns/1ns
module data_minus(
	input clk,
	input rst_n,
	input [7:0]a,
	input [7:0]b,

	output  reg [8:0]c
);

    always @(posedge clk, negedge rst_n)
        begin
            if (!rst_n) begin c<=0;end
            else begin
                c<=(a>b)?(a-b):(b-a);
            end
        end

endmodule

module testbench();
	reg signed [7:0] a,b;
	reg clk,rst_n;
	wire signed [8:0]c;

    always #005 clk<=~clk;

    initial begin
        #000 clk = 0; rst_n = 0;
        #010 rst_n = 1;
        #020 a=8'b10101010;b=8'b01010101;
        #020 a=8'b00001010;b=8'b11010101;
        #020 a=8'b11111010;b=8'b01010100;
        #020 a=8'b11111010;b=8'b11000000;
        $stop;
    end

    initial begin
        $dumpfile("out.vcd");
        $dumpvars(0,testbench);
    end

    data_minus dut(
        .clk(clk),
        .rst_n(rst_n),
        .a(a),
        .b(b),
        .c(c)
    );

endmodule