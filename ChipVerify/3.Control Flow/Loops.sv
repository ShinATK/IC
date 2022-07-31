/* forever */
// This is a infinite loop, just like while. Note that your simulation will hang unless you include a time delay inside the forever vlock to advance simulation time.
module forever_tb;
    initial begin
        forever begin
            #5 $display("Hello World!");
        end
    end

    initial 
        #50 $finish;
endmodule

/* repeat */
module repeat_tb;
    initial begin
        repeat(5) begin
            $display("Hello World!");
        end
    end
endmodule

/* while */
module while_tb;
    bit clk;
    always #10 clk=~clk;
    initial begin
        bit [3:0] counter;

        $display("Counter = %0d", counter);
        while(counter < 10) begin
            @(posedge clk);
            counter ++;
            $display("Counter = %0d", counter);
        end
        $display("Counter = %0d", counter);
        $finish;
    end
endmodule

/* for */
module for_tb;
    bit clk;

    always #10 clk=~clk;
    initial begin
        bit [3:0] counter;

        $display("Counter = %0d", counter);
        for (counter = 2; counter <14; counter =counter+2) begin
            @(posedge clk);
            $display("Counter = %0d", counter);
        end
        $display("Counter = %0d", counter);
        $finish;
    end
endmodule

/* do-while */
module do_while_tb;
    bit clk;
    always #10 clk=~clk;
    initial begin
        bit [3:0] counter;
        $display("Counter = %0d", counter);

        do begin
            @(posedge clk);
            counter ++;
            $display("Counter = %0d", counter);
        end while(counter<5);
        $display("Counter = %0d", counter);
        $finish;
    end
endmodule

/* foreach */
module foreach_tb;
    bit [7:0] array[8];

    initial begin
        foreach (array[index]) begin
            array[index] = index;
        end

        foreach (array[index]) begin
            $display("array[%0d] = 0x%0d", index, array[index]);
        end
    end
endmodule