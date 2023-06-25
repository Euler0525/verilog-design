`timescale  1ns / 1ps
`include "scan_display.v"

module tb_scan_display;

parameter PERIOD  = 10;
reg   clk  ;
reg   rst_n;

wire  [3:0]  select ;
wire  [3:0]  segment;

scan_display u_scan_display(
    .clk     ( clk     ),
    .rst_n   ( rst_n   ),
    .select  ( select  ),
    .segment ( segment )
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
    $dumpfile("wave.vcd");
    $dumpvars;
    #200 $finish;
end

endmodule