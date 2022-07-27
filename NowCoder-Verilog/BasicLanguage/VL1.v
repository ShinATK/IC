// 四选一多路器
`timescale 1ns/1ns
module mux4_1(
input [1:0]d1,d2,d3,d0,
input [1:0]sel,
output[1:0]mux_out
);
//*************code***********//
    reg [1:0] mux_out_reg;
    always @(*) begin
        if(sel==2'b00)begin
            mux_out_reg=d3; 
        end
        else if(sel==2'b01)begin
            mux_out_reg=d2; 
        end
        else if(sel==2'b10)begin
            mux_out_reg=d1; 
        end
        else begin
            mux_out_reg=d0; 
        end
    end
    assign mux_out = mux_out_reg;
//*************code***********//
endmodule