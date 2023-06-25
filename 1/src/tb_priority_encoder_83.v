`timescale  1ns / 1ps
`include "priority_encoder_83.v"

module tb_priority_encoder_83;

reg   [7:0]  din;
wire  [2:0]  dout;

priority_encoder_83  u_priority_encoder_83 (
    .din  (din   [7:0]),
    .dout (dout  [2:0])
);

initial
begin
    din = 8'b00000001;
    #10 din = 8'b00000011;
    #10 din = 8'b00000101;
    #10 din = 8'b00001000;
    #10 din = 8'b00010000;
    #10 din = 8'b00100010;
    #10 din = 8'b01010010;
    #10 din = 8'b11100100;
    #10 din = 8'b00000001;

    $finish;
end

endmodule