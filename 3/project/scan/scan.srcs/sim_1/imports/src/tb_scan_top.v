`timescale  1ns / 1ps
`include "scan_top.v"

module tb_scan_top;

parameter PERIOD  = 10;

reg   clk  ;
reg   rst_n;

wire  [3:0]  select ;
wire         rbo_n  ;
wire  [6:0]  seg_out;
wire         dp_out ;


scan_top  u_scan_top (
    .clk                     ( clk            ),
    .rst_n                   ( rst_n          ),

    .select                  (select          ),

    .rbo_n                   ( rbo_n          ),
    .seg_out                 ( seg_out  [6:0] ),
    .dp_out                  ( dp_out         )
);

initial begin
    clk   = 1'b0 ;
    rst_n = 1'b0 ;
end

always
begin
    #(PERIOD / 2)
    clk = ~clk ;
    rst_n = 1'b1;
end
initial
begin
    #200 $finish;
end

endmodule