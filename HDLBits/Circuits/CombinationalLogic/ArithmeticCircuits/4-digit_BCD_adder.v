module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire cout0, cout1, cout2;
    bcd_fadd bcd0(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(cout0),
        .sum(sum[3:0])
    );
    bcd_fadd bcd1(
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(cout0),
        .cout(cout1),
        .sum(sum[7:4])
    );
    bcd_fadd bcd2(
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(cout1),
        .cout(cout2),
        .sum(sum[11:8])
    );
    bcd_fadd bcd3(
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(cout2),
        .cout(cout),
        .sum(sum[15:12])
    );

endmodule
