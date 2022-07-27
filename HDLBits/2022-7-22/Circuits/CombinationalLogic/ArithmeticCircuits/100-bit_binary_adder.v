module top_module (
	input [99:0] a,
	input [99:0] b,
	input cin,
	output cout,
	output [99:0] sum
);

	// The concatenation {cout, sum} is a 101-bit vector.
	assign {cout, sum} = a+b+cin;

endmodule

// module top_module( 
//     input [99:0] a, b,
//     input cin,
//     output cout,
//     output [99:0] sum );

//     wire [100:0] s;
//     assign sum=a+b+cin;
//     assign s=a+b+cin;
//     assign cout=s[100];
// endmodule
