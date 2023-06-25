`timescale  1ns / 1ps
`include "seven_segment_decoder.v"

module tb_seven_segment_decoder;


reg   [3:0]  din;
reg          ib_n;
reg          lt_n;
reg          rbi_n;

wire         rbo_n;
wire         dp_out;
wire  [6:0]  seg_out;
wire         select;


seven_segment_decoder  u_seven_segment_decoder (
    .din      (din      [3:0]),
    .ib_n     (ib_n          ),
    .lt_n     (lt_n          ),
    .rbi_n    (rbi_n         ),
    .rbo_n    (rbo_n         ),
    .dp_out   (dp_out        ),
    .seg_out  (seg_out  [6:0]),
    .select   (select        )
);

initial
begin
    ib_n = 1'b1;
    lt_n = 1'b1;
    rbi_n = 1'b1;
    din = 4'b0000;
    #10 din = 4'b0001;
    #10 din = 4'b0010;
    #10 din = 4'b0011;
    #10 din = 4'b0100;
    #10 din = 4'b0101;
    #10 din = 4'b0110;
    #10 din = 4'b0111;
    #10 din = 4'b1000;
    #10 din = 4'b1001;
    #10 din = 4'b1010;
    #10 din = 4'b1011;
    #10 din = 4'b1100;
    #10 din = 4'b1101;
    #10 din = 4'b1110;
    #10 din = 4'b1111;

    $finish;
end

endmodule