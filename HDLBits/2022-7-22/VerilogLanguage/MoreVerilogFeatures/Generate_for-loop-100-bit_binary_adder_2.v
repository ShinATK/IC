module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    genvar i;
    generate
        add1 add(
            .a(a[0]),
            .b(b[0]),
            .cin(cin),
            .sum(sum[0]),
            .cout(cout[0])
        );
        for (i=1;i<=99;i=i+1) begin: adder100
            add1 add1(
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i-1]),
                .sum(sum[i]),
                .cout(cout[i])
            );
        end
    endgenerate

    // integer i;
    // always @(*)begin
    //     //第一个全加器的进位参与下一个全加器的运算
    //     cout[0]=a[0]&b[0]|a[0]&cin|b[0]&cin;
        
    //     sum[0]=a[0]^b[0]^cin; 
    //     for (i=1;i<=99;i=i+1)begin
    //         //第i个全加器计算的进位，参与第i+1个全加器的运算
    //         cout[i]=a[i]&b[i]|a[i]&cout[i-1]|b[i]&cout[i-1];
    //         sum[i]=a[i]^b[i]^cout[i-1];
    //     end
    // end

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