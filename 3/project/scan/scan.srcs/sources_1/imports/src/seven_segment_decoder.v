/*
 * 七段译码管
 *
 * 输入：4位（SW3-SW0）
 *      灭灯信号（低有效，优先级最高，SW7）
 *      测灯信号（低有效，优先级第二，SW6）
 *      灭零信号输入（低有效，SW5）
 * 输出：灭零信号输出（低有效，LD2 0）
 *      显示输出（数字和小数点）
 *      位选信号（BIT8 G6）
 */


// 低电平有效
module seven_segment_decoder(
    din    ,  // 4位输入
    ib_n   ,  // 灭灯信号1
    lt_n   ,  // 测灯信号2
    rbi_n  ,  // 灭零信号输入
    rbo_n  ,  // 灭零信号输出
    seg_out,  // 七段数码管显示输出
    dp_out ,  // 小数点显示信号
    select    // 位选信号
);

    input        [3:0]  din    ;  // 4位输入
    input               ib_n   ;  // 灭灯信号1`
    input               lt_n   ;  // 测灯信号2`
    input               rbi_n  ;  // 灭零信号输入
    output  reg         rbo_n  ;  // 灭零信号输出
    output  reg  [6:0]  seg_out;  // 七段数码管输出信号
    output  reg         dp_out ;  // 小数点显示信号
    output  reg         select = 1'b1;  // 位选信号

    // rbo_n
    always @(*)
    begin
        if (ib_n == 1'b0)
            begin
                rbo_n = 1'b1;
            end
        else if (lt_n == 1'b0)
            begin
                rbo_n = 1'b1;
            end
        // 灭零
        else if ((rbi_n == 1'b0) && (din == 4'b0000))
            begin
                rbo_n = 1'b0;
            end
        else
            begin
                rbo_n = 1'b1;
            end
    end

    // seg_out
    always @(*)
    begin
        // 灭灯
        if (ib_n == 1'b0)
            begin
                seg_out = 7'b0000000;
            end
        // 测灯
        else if (lt_n == 1'b0)
            begin
                seg_out = 7'b1111111;
            end
        // 灭零
        else if ((rbi_n == 1'b0) && (din == 4'b0000))
            begin
                seg_out = 7'b0000000;
            end
        // 正常显示数字
        else
            begin
                case (din)
                    //       seg_out = 7'bABCDEFG
                    4'b0000: seg_out = 7'b1111110;
                    4'b0001: seg_out = 7'b0110000;
                    4'b0010: seg_out = 7'b1101101;
                    4'b0011: seg_out = 7'b1111001;
                    4'b0100: seg_out = 7'b0110011;
                    4'b0101: seg_out = 7'b1011011;
                    4'b0110: seg_out = 7'b1011111;
                    4'b0111: seg_out = 7'b1110000;
                    4'b1000: seg_out = 7'b1111111;
                    4'b1001: seg_out = 7'b1110011;
                    4'b1010: seg_out = 7'b0001101;
                    4'b1011: seg_out = 7'b0011001;
                    4'b1100: seg_out = 7'b0100011;
                    4'b1101: seg_out = 7'b1001011;
                    4'b1110: seg_out = 7'b0001111;
                    4'b1111: seg_out = 7'b0000000;
                    default  seg_out = 7'b0000000;
                endcase
            end
    end

    // dp_out
    always @(*)
    begin
        // 灭灯
        if (ib_n == 1'b0)
            begin
                dp_out = 1'b0;
            end
        // 测灯
        else if (lt_n == 1'b0)
            begin
                dp_out = 1'b1;
            end
        // 灭零
        else if ((rbi_n == 1'b0) && (din == 4'b0000))
            begin
                dp_out = 1'b0;
            end
        else
            begin
                dp_out = 1'b0;
            end
    end

endmodule
