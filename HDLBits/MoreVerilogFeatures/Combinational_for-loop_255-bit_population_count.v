// module top_module( 
//     input [254:0] in,
//     output [7:0] out );

//     integer i;
//     wire [7:0] count;
//     always @(*)begin
//         count = 8'b0;
//         for (i=0; i<=254; i=i+1)begin
//             count = count+{7'b0, in[i]&1'b1};
//         end
//     end
//     assign out=count;

// endmodule

module top_module (
	input [254:0] in,
	output reg [7:0] out
);

	always @(*) begin	// Combinational always block
		out = 0;
		for (int i=0;i<255;i++)
			out = out + in[i];
	end
	
endmodule
