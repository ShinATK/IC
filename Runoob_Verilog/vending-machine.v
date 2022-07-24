//vending-machine
//2 yuan for a bottle of drink
//only 2 coins supported: 5 jiao and 1 yuan
//finish the function of selling and changing

module vending_machine_p3(
    input               clk,
    input               rstn,
    input   [1:0]       coin,//01 for 5 jiao, 10 for 1 yuan
    output  [1:0]       change,
    output              sell);//output the drink);

    //machine state decode
    parameter           IDLE    =   3'd0;
    parameter           GET05   =   3'd1;
    parameter           GET10   =   3'd2;
    parameter           GET15   =   3'd3;
    parameter           GET20   =   3'd4;

    //machine variable
    reg     [2:0]       st_next;
    reg     [2:0]       st_cur;

    //(1)state transfer
    always @(posedge clk or negedge rstn)begin
        if (!rstn) begin
            st_cur <= 'b0;
        end
        else begin
            st_cur <= st_next;
        end
    end

    //(2)state switch, using block assigment for combination-logic
    //all case items need to be displayed completely
    always @(*)begin
        case(st_cur)
            IDLE:       
                case(coin)
                    2'b01:      st_next = GET05;
                    2'b10:      st_next = GET10;
                    default:    st_next = IDLE;
                endcase
            GET05:       
                case(coin)
                    2'b01:      st_next = GET10;
                    2'b10:      st_next = GET15;
                    default:    st_next = GET05;
                endcase
            GET10:       
                case(coin)
                    2'b01:      st_next = GET15;
                    2'b10:      st_next = IDLE;
                    default:    st_next = GET10;
                endcase
            GET15:       
                case(coin)
                    2'b01:      st_next = IDLE;
                    2'b10:      st_next = IDLE;
                    default:    st_next = GET15;
                endcase
            default:            st_cur = IDLE;
        endcase
    end

    //(3)output logic, using non-block assignment
    reg [1:0]       change_r;
    reg             sell_r;
    always@(posedge clk or negedge rstn)begin
        if(!rstn)begin
            change_r    <=  2'b0;
            sell_r      <=  1'b0;
        end
        else if((st_cur == GET15 && coin == 2'd1)
        ||(st_cur == GET10 && coin == 2'd2)) begin
            change_r <= 2'b0;
            sell_r <= 1'b1;
        end
        else if((st_cur == GET15 && coin == 2'd2)) begin
            change_r <= 2'b1;
            sell_r <= 1'b1;
        end
        else begin
            change_r    <=  2'b0;
            sell_r      <=  1'b0;
        end
    end
    assign sell     = sell_r;
    assign change   = change_r;

endmodule


`timescale 1ns/1ns
module vending_machine_p3_tb;
    reg             clk;
    reg             rstn;
    reg  [1:0]      coin;
    wire [1:0]      change;
    wire            sell;

    //clock generating
    parameter   CYCLE_200MHz = 10;//
    always begin
        clk = 0; #(CYCLE_200MHz/2);
        clk = 1; #(CYCLE_200MHz/2);
    end

    //motivating generating
    reg [9:0] buy_oper; // store state of the buy operation
    initial begin
        buy_oper    =   'h0;
        coin        =   2'h0;
        rstn        =   1'b0;
        #8 rstn     =   1'b1;
        @(negedge clk);

        //case(1) 0.5->0.5->0.5->0.5
        #16;
        buy_oper        =   10'b00_0101_0101;
        repeat(5)begin
            @(negedge clk);
            coin        =   buy_oper[1:0];
            buy_oper    =   buy_oper>>2;
        end

        //case(2) 1 -> 0.5 -> 1, taking change
        #16 ;
        buy_oper  = 10'b00_0010_0110 ;
        repeat(5) begin
            @(negedge clk) ;
            coin      = buy_oper[1:0] ;
            buy_oper  = buy_oper >> 2 ;
        end

        //case(3) 0.5 -> 1 -> 0.5
        #16 ;
        buy_oper  = 10'b00_0001_1001 ;
        repeat(5) begin
            @(negedge clk) ;
            coin      = buy_oper[1:0] ;
            buy_oper  = buy_oper >> 2 ;
        end

        //case(4) 0.5 -> 0.5 -> 0.5 -> 1, taking change
        #16 ;
        buy_oper  = 10'b00_1001_0101 ;
        repeat(5) begin
            @(negedge clk) ;
            coin      = buy_oper[1:0] ;
            buy_oper  = buy_oper >> 2 ;
        end
    end

    //(1)mealy state with 3-stage
    vending_machine_p3  u_mealy_p3(
        .clk            (clk),
        .rstn           (rstn),
        .coin           (coin),
        .change         (change),
        .sell           (sell));

    //simulation stop
    always begin
        #100;
        if ($time >= 10000) $stop;
    end

endmodule