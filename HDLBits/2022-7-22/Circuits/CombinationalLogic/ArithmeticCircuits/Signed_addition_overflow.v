module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //   
    assign s = a+b;
    // 两个正数相加或两个负数相加时，会发生符号位溢出
    assign overflow = ~a[7]&~b[7]&s[7]|a[7]&b[7]&~s[7];
endmodule
