`timescale  1ns / 1ps
`include "comparator_4.v"

module tb_comparator_4;

reg   [3:0]  din1;
reg   [3:0]  din2;
wire  [2:0]  dout;    


comparator_4  u_comparator_4 (
    .din1  (din1  [3:0]),
    .din2  (din2  [3:0]),
    .dout  (dout  [2:0])
);

initial
begin
    din1 = 4'b1010;
    din2 = 4'b0101;
    #10
    din1 = 4'b1000;
    din2 = 4'b1000;
    #10
    din1 = 4'b0110;
    din2 = 4'b1001;
    #10
    din1 = 4'b0000;
    din2 = 4'b0000;

    $finish;
end

endmodule