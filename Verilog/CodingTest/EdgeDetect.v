module shift_pluse(
    input clk,
    input rstn,
    input shift_in,

    output reg shift_in_1,
    output reg shift_in_2,
    output P_Pluse,
    output N_Pluse
);

    

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            shift_in_1 <= 1'b0;
            shift_in_2 <= 1'b0;
        end
        else begin
            shift_in_1 <= shift_in;
            shift_in_2 <= shift_in_1;
        end
    end

    assign P_Pluse = (!shift_in_2)&(shift_in_1);
    assign N_Pluse = (!shift_in_1)&(shift_in_2);
endmodule

module shift_pluse_tb;
    reg clk;
    reg rstn;
    reg shift_in;

    wire shift_in_1;
    wire shift_in_2;
    wire P_Pluse;
    wire N_Pluse;

    shift_pluse u_shift_pluse(
        .clk(clk),
        .rstn(rstn),
        .shift_in(shift_in),
        .shift_in_1(shift_in_1),
        .shift_in_2(shift_in_2),
        .P_Pluse(P_Pluse),
        .N_Pluse(N_Pluse)
    );

    initial clk=1;
    always #5 clk = ~clk;

    initial begin
        shift_in = 1'b0;
        rstn = 1'b1;
        #200;
        rstn = 1'b0;
        #100;
        rstn = 1'b1;

        #300;
        shift_in = 1'b1;
        #300;
        shift_in = 1'b0;
        #300;

        $stop;
    end
endmodule