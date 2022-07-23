module top_module(
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out
);

	// We can't part-select multiple bits without an error, but we can select one bit at a time,
	// four times, then concatenate them together.
	assign out = {in[sel*4+3], in[sel*4+2], in[sel*4+1], in[sel*4+0]};

	// Alternatively, "indexed vector part select" works better, but has an unfamiliar syntax:
	// assign out = in[sel*4 +: 4];		// Select starting at index "sel*4", then select a total width of 4 bits with increasing (+:) index number.
	// assign out = in[sel*4+3 -: 4];	// Select starting at index "sel*4+3", then select a total width of 4 bits with decreasing (-:) index number.
	// Note: The width (4 in this case) must be constant.

    // assign out[0]=in[sel*4];
    // assign out[1]=in[1+sel*4];
    // assign out[2]=in[2+sel*4];
    // assign out[3]=in[3+sel*4];

    // assign out = int[sel*4 +:4]; //往索引增加的方向获取四位，4必须为常数

endmodule