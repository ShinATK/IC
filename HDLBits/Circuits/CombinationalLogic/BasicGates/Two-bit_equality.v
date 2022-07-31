module top_module(
    input [1:0] A,
    input [1:0] B,
    output z
);
    assign z=(A[1:0]==B[1:0]);// Comparisons produce a 1 or 0 result.
    // always@(*)
    //     if (A==B)begin z=1; end
    //     else begin z=0; end
endmodule