// integer:
//      signed; unsigned
module tb;
// By default int data types are signed which means
// that MSB is the sign bit and the integer variables can 
// also store negative numbers
    shortint    var_a;
    int         var_b;
    longint     var_c;

//  Unsigned 
    // shortint unsigned   var_a;
    // int unsigned        var_b;
    // longint signed      var_c; maximum value roll over to 0

    initial begin
        //Print initial values of the integer variables
        $display("Sizes var_a=%0d var_b=%0d var_c=%0d", $bits(var_a), $bits(var_b), $bits(var_b));

        //Assign the maximum value for each of the variables
        //MSB of each variable represents the sign bit and is set to 0
        //Rest of the bit positions are filled with 1 and hence you
        //get the maximum value that these variables can hold
        #1  var_a = 'h7FFF;
            var_b = 'h7FFF_FFFF;
            var_c = 'h7FFF_FFFF_FFFF_FFFF;

        //When added a 1, the sign changes to negative because this is a signed variable
        #1  var_a += 1;     //Value becomes 'h8000 => which is a rollover from +sign to -sign
            var_b += 1;     //Value becomes 'h8000_0000 => which is a rollover from +sign to -sign
            var_c += 1;
    end

    //Start a monitor to print out values of each variables as they change
    initial 
        $monitor("var_a=%0d var_b=%0d var_c=%0d", var_a, var_b, var_c);
endmodule