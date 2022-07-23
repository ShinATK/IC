module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum1,sum2,sum3;
    wire cout;

    add16 add16_1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(0),
        .sum(sum1),
        .cout(cout)
    );

    add16 add16_2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(0),
        .sum(sum2),
        .cout()
    );
    add16 add16_3(
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(1),
    .sum(sum3),
    .cout()
    );

    always@(*)
        case(cout)
            1'b0:begin sum={sum2, sum1}; end
            1'b1:begin sum={sum3, sum1}; end
        endcase

endmodule