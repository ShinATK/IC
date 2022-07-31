module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    reg [3:0] q0, q1, q2, q3;
    reg ena1, ena2, ena3;
    always @(posedge clk)begin
        q0 <= (~reset&~(q0==9))? q0+1:0;

        
        if (~reset&(q0==9)&(q1!=9))begin q1<=q1+1;end
        else if(reset|(q0==9)&(q1==9))begin q1<=0;end
        else begin q1<=q1;end

        
        if (~reset&(q0==9)&(q1==9)&(q2!=9))begin q2<=q2+1;end
        else if(reset|(q0==9)&(q1==9)&(q2==9))begin q2<=0;end
        else begin q2<=q2;end

        
        if (~reset&(q0==9)&(q1==9)&(q2==9)&(q3!=9))begin q3<=q3+1;end
        else if(reset|(q0==9)&(q1==9)&(q2==9)&(q3==9))begin q3<=0;end
        else begin q3<=q3;end
        
    end
    
    assign ena1=(q0==9);
    assign ena2=(q0==9)&(q1==9);
    assign ena3=(q0==9)&(q1==9)&(q2==9);

    assign q = {q3, q2, q1, q0};
    assign ena = {ena3, ena2, ena1};

endmodule