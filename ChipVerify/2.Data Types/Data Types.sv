// How to write floating point and exponential numbers?
module tb;
    real            pi;             // Declared to be of type real
    real            freq;           

    initial begin
        pi   = 3.14;
        freq = 1e6;

        $display("Variable of pi = %f", pi);
        $display("Variable of pi = %0.3f", pi);
        $display("Variable of freq = %0d", freq);
    end
endmodule

// Output
//  Value of pi = 3.140000
//  Value of pi = 3.140
//  Value of freq = 1000000.000000