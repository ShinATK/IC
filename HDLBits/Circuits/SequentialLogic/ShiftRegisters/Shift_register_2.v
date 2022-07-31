module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

    wire [3:0] Q;
    MUXDFF dff0(.clk(KEY[0]),.w(KEY[3]),.R(SW[3]),.E(KEY[1]),.L(KEY[2]),.Q(Q[3]));
    MUXDFF dff1(.clk(KEY[0]),.w(Q[3]),.R(SW[2]),.E(KEY[1]),.L(KEY[2]),.Q(Q[2]));
    MUXDFF dff2(.clk(KEY[0]),.w(Q[2]),.R(SW[1]),.E(KEY[1]),.L(KEY[2]),.Q(Q[1]));
    MUXDFF dff3(.clk(KEY[0]),.w(Q[1]),.R(SW[0]),.E(KEY[1]),.L(KEY[2]),.Q(Q[0]));

    assign LEDR=Q;

endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q);

    always @(posedge clk)begin
        Q<=(L?R:(E?w:Q));
    end
endmodule