module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

	reg [7:0] q;	
	// The final circuit is a shift register attached to a 8-to-1 mux.
	// Create a 8-to-1 mux that chooses one of the bits of q based on the three-bit number {A,B,C}:
	// There are many other ways you could write a 8-to-1 mux
	// (e.g., combinational always block -> case statement with 8 cases).
	assign Z = q[ {A, B, C} ];
	// Edge-triggered always block: This is a standard shift register (named q) with enable.
	// When enabled, shift to the left by 1 (discarding q[7] and and shifting in S).
	always @(posedge clk) begin
		if (enable)
			q <= {q[6:0], S};	
	end


    // reg [7:0] Q;
    // always @(posedge clk) begin
    //     if (enable)begin
    //         Q[7:0]<={Q[6:0], S};
    //     end
    //     else begin Q<=Q;end
    // end

    // wire [2:0] D_input={A, B, C};
    // always @(*) begin
    //     case(D_input)
    //         3'd0: Z=Q[0];
    //         3'd1: Z=Q[1];
    //         3'd2: Z=Q[2];
    //         3'd3: Z=Q[3];
    //         3'd4: Z=Q[4];
    //         3'd5: Z=Q[5];
    //         3'd6: Z=Q[6];
    //         3'd7: Z=Q[7];
    //     endcase
    // end

endmodule
