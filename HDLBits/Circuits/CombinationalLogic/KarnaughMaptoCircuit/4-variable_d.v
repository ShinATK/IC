module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
	assign out=a&~c|~b&c|a&b&c|~a&b&~c&~d;
    // assign out=a|~a&~b&c|b&~c&~d;
endmodule
