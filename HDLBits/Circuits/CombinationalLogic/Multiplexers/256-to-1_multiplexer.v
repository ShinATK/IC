module top_module(
    input [255:0] in,
    input [7:0] sel,
    output out
);
	// Select one bit from vector in[]. The bit being selected can be variable.
	assign out = in[sel];

    // integer i;
    // always@(*)begin
    //     for (i=0;i<=255;i=i+1)begin
    //         if (i==sel)begin
    //             out=in[i];
    //         end
    //     end
    // end
endmodule