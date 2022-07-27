`timescale 1ns/1ns
module Tff_2 (
input wire data, clk, rst,
output reg q  
);
//*************code***********//

    reg q_0;

    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            q_0 <= 0;
            q <= 0;
        end
        else begin
            q_0<=data^q_0;
            q<=q_0^q;
        end
    end

//*************code***********//
endmodule