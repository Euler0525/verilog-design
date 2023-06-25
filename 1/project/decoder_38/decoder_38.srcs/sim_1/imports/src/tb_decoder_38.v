`timescale  1ns / 1ps
`include "decoder_38.v"

module tb_decoder_38;

reg   [2:0]  din;
wire  [7:0]  dout;

decoder_38  u_decoder_38 (
    .din  (din   [2:0]),
    .dout (dout  [7:0])
);

initial
begin
    din = 3'b000;
    #10 din = 3'b001;
    #10 din = 3'b010;
    #10 din = 3'b011;
    #10 din = 3'b100;
    #10 din = 3'b101;
    #10 din = 3'b110;
    #10 din = 3'b111;
    #10 din = 3'b000;

    $finish;
end

endmodule