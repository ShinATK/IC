// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    always@(*) begin
        case(in)
            4'd0:begin pos=2'd0; end
            4'd1:begin pos=2'd0; end
            4'd2:begin pos=2'd1; end
            4'd3:begin pos=2'd0; end
            4'd4:begin pos=2'd2; end
            4'd5:begin pos=2'd0; end
            4'd6:begin pos=2'd1; end
            4'd7:begin pos=2'd0; end
            4'd8:begin pos=2'd3; end
            4'd9:begin pos=2'd0; end
            4'd10:begin pos=2'd1; end
            4'd11:begin pos=2'd0; end
            4'd12:begin pos=2'd2; end
            4'd13:begin pos=2'd0; end
            4'd14:begin pos=2'd1; end
            4'd15:begin pos=2'd0; end
            default: pos=2'b0;
        endcase
    end

endmodule
