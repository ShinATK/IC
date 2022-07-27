`timescale 1ns/1ns

module data_cal(
input clk,
input rst,
input [15:0]d,
input [1:0]sel,

output [4:0]out,
output validout
);
//*************code***********//

    localparam M0=2'b00;
    localparam M1=2'b01;
    localparam M2=2'b10;
    localparam M3=2'b11;

    reg [3:0] current_state, next_state;
    reg [15:0] d_temp;
    reg [4:0] out_tmp;
    reg validout_tmp;

    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            d_temp <= 0;
            out_tmp <= 0;
            validout_tmp <= 0;
        end
        else begin
            case(sel)
                M0:
                    begin
                        d_temp <= d;
                        out_tmp <= 0;
                        validout_tmp <= 0;
                    end
                M1:
                    begin
                        d_temp <= d_temp;
                        out_tmp <= d_temp[3:0]+d_temp[7:4];
                        validout_tmp <= 1;
                    end
                M2:
                    begin
                        d_temp <= d_temp;
                        out_tmp <= d_temp[3:0]+d_temp[11:8];
                        validout_tmp <= 1;
                    end
                M3:
                    begin
                        d_temp <= d_temp;
                        out_tmp <= d_temp[3:0]+d_temp[15:12];
                        validout_tmp <= 1;
                    end
                default: 
                    begin
                        d_temp <= d;
                        out_tmp <= 0;
                        validout_tmp <= 0;
                    end
            endcase
        end
    end

    assign out = out_tmp;
    assign validout = validout_tmp;
//*************code***********//
endmodule