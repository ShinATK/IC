module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

    wire [15:0] sum1, sum2;
    wire cout1, cout2;
    add1 add1(.a(),.b(),.cin(),.sum(),.cout());
    add16 add16_1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(0),
        .sum(sum1),
        .cout(cout1)
    );
    add16 add16_2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(cout1),
        .sum(sum2),
        .cout(cout2)
    );

    assign sum={sum2, sum1};

endmodule

module add1 (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    assign sum=a^b^cin;
    assign cout=a&b|a&cin|b&cin;

// Full adder module here

endmodule