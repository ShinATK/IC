//奇偶校验
`timescale 1ns/1ns
module odd_sel(
input [31:0] bus,
input sel,
output check
);
//*************code***********//
    reg check_reg;
    always @(*) begin
        if (sel) begin
            check_reg <= ^bus;
        end
        else begin
            check_reg <= ~(^bus);
        end
    end
    assign check = check_reg;
//*************code***********//
endmodule