// 2022-7-20 Shin
// inverter design；
`timescale 1ns/10ps //1ns，10ps

module inv(A, Y);

    // define port properties
    input A;
    output Y;

    // define input & output relationships
    assign Y=~A;

endmodule

// testbench of inv
module inv_tb;

    reg aa;
    wire yy;

    inv inv(.A(aa), .Y(yy));

    // initial statement can define the value of a variable by time
    initial begin
        aa<=0;
        #10 aa<=1; // #10 time unit
        #10 aa<=0;
        #10 aa<=1;
        #10 $stop;
    end

endmodule