`timescale  1ns / 1ps
`include "multifunction.v"

module tb_multifunction;


// multifunction Inputs
reg   [3:0]  din1 ;
reg   [3:0]  din2 ;
reg          b_add;
reg          b_cmp;
reg          b_max;
reg          b_min;

// multifunction Outputs
wire  [6:0]  dout1  ;
wire  [6:0]  dout2  ;
wire         dp_out1;
wire         dp_out2;
wire         select1;
wire         select2;
wire         led1   ;
wire         led2   ;


multifunction  u_multifunction (
    .din1    ( din1    ),
    .din2    ( din2    ),

    .b_add   ( b_add   ),
    .b_cmp   ( b_cmp   ),
    .b_max   ( b_max   ),
    .b_min   ( b_min   ),

    .dout1   ( dout1   ),
    .dout2   ( dout2   ),
    .dp_out1 ( dp_out1 ),
    .dp_out2 ( dp_out2 ),

    .select1 ( select1 ),
    .select2 ( select2 ),
    .led1    ( led1    ),
    .led2    ( led2    )
);

initial
begin
    din1 = 4'b0000;
    din2 = 4'b0000;
    b_add = 1'b0  ;
    b_cmp = 1'b0  ;
    b_max = 1'b0  ;
    b_min = 1'b0  ;

    // Start Test1
    #10
    din1 = 4'b0101;
    din2 = 4'b1001;
    #10 b_add = 1'b1;
    #20 b_cmp = 1'b1; b_add = 1'b0;
    #20 b_max = 1'b1; b_cmp = 1'b0;
    #20 b_min = 1'b1; b_max = 1'b0;
    #20
    b_min = 1'b0;
    din1 = 4'b0000;
    din2 = 4'b0000;

    // Start Test2
    #10
    din1 = 4'b1010;
    din2 = 4'b0110;
    #10 b_add = 1'b1;
    #20 b_cmp = 1'b1; b_add = 1'b0;
    #20 b_max = 1'b1; b_cmp = 1'b0;
    #20 b_min = 1'b1; b_max = 1'b0;
    #20
    din1 = 4'b0000;
    din2 = 4'b0000;
    b_add = 1'b0  ;
    b_cmp = 1'b0  ;
    b_max = 1'b0  ;
    b_min = 1'b0  ;

    $finish;
end

endmodule