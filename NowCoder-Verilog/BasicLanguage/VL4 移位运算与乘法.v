`timescale 1ns/1ns
module multi_sel(
input [7:0]d ,
input clk,
input rst,
output reg input_grant,
output reg [10:0]out
);
//*************code***********//
    localparam M1 = 2'b00;
    localparam M3 = 2'b01;
    localparam M7 = 2'b10;
    localparam M8 = 2'b11;

    reg [2:0] current_state, next_state;

    reg [7:0] d_temp;

    //状态跳转实现（时序逻辑，由时钟沿触发）(对现态的描述)
    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            current_state <= M1;
        end
        else begin
            current_state <= next_state;
        end
    end

    // 状态转移逻辑(组合逻辑)（对次态的描述）
    always @(*) begin
        case(current_state)
            M1: 
                begin
                    next_state = M3;
                    d_temp = d;
                end
            M3: 
                begin
                    next_state = M7;
                    d_temp = d_temp;
                end
            M7: 
                begin
                    next_state = M8;
                    d_temp = d_temp;
                end
            M8: 
                begin
                    next_state = M1;
                    d_temp = d_temp;
                end
            default: 
                begin
                    next_state = M1;
                    d_temp = d;
                end
        endcase
    end

    //输出(时序逻辑，描述输出关系，可以是多个always输出)
    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            out <= 0;
            input_grant <= 0;
        end
        else begin
            case(current_state)
                M1: 
                    begin 
                        out <= d_temp;
                        input_grant <= 1;
                    end
                M3: 
                    begin 
                        out <= d_temp*3;
                        input_grant <= 0;
                    end
                M7: 
                    begin 
                        out <= d_temp*7;
                        input_grant <= 0;
                    end
                M8: 
                    begin 
                        out <= d_temp*8;
                        input_grant <= 0;
                    end
                default: 
                    begin 
                        out <= 0;
                        input_grant <= 0;
                    end
            endcase
        end
    end
            
//*************code***********//
endmodule