module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    //一定注意声明位宽
    wire [31:0] b_xor;
    //减法时，求补码需要进行补码转换，即异或操作每一位
    assign b_xor=b^{32{sub}};

    wire [15:0] sum1,sum2;
    wire cout;

    add16 add1(
        .a(a[15:0]),
        .b(b_xor[15:0]),
        .cin(sub),
        .sum(sum1),
        .cout(cout)
    );
    add16 add2(
        .a(a[31:16]),
        .b(b_xor[31:16]),
        .cin(cout),
        .sum(sum2),
        .cout()
    );

    assign sum={sum2,sum1};

endmodule