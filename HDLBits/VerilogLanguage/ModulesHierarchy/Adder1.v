module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire[15:0] sum1, sum2;
    wire cout_temp1, count_temp2;
    
    add16 add1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(0),
        .sum(sum1),
        .cout(cout_temp1)
    );
    add16 add2(
        .a(a[31:16]),
        .b(b[31:16]), 
        .cin(cout_temp1),
        .sum(sum2),
        .cout(count_temp2)
    );

    assign sum={sum2, sum1};

endmodule