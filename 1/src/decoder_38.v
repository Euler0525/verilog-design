/*
 * 3-8译码器
 *
 * 输入：3位（SW2-SW0）
 * 输出：8位（高有效，LD2 7-0）
 */


module decoder_38(
    din ,  // 输入(SW2-SW0)
    dout   // 输出(LD2 7-0)
);
    input        [2:0]  din ;
    output  reg  [7:0]  dout;

    always @(*) begin
        case (din)
            3'b000: dout = 8'b00000001;
            3'b001: dout = 8'b00000010;
            3'b010: dout = 8'b00000100;
            3'b011: dout = 8'b00001000;
            3'b100: dout = 8'b00010000;
            3'b101: dout = 8'b00100000;
            3'b110: dout = 8'b01000000;
            3'b111: dout = 8'b10000000;
            default dout = 8'b00000000;
        endcase
    end

endmodule
