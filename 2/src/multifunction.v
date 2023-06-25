`include "select.v"
`include "mmin.v"
`include "mmax.v"
`include "adder.v"
`include "comparator.v"
`include "seven_segment_decoder.v"

module multifunction(
    din1   ,  // 数据A
    din2   ,  // 数据B

    b_add  ,  // 求和按钮
    b_cmp  ,  // 比较按钮
    b_max  ,  // 最大值按钮
    b_min  ,  // 最小值按钮

    dout1  ,  // 高位输出
    dout2  ,  // 低位输出
    dp_out1,  // 高位小数点
    dp_out2,  // 低位小数点

    select1,
    select2,
    led1   ,
    led2
);
    input   [3:0]  din1;
    input   [3:0]  din2;

    input          b_add;
    input          b_cmp;
    input          b_max;
    input          b_min;

    output  [6:0]  dout1;
    output  [6:0]  dout2;
    output         dp_out1;
    output         dp_out2;

    output select1;
    output select2;
    output led1;
    output led2;

    // 中间变量，存储各功能模块输出
    wire    [3:0]  la1;
    wire    [3:0]  la2;
    wire    [3:0]  lc1;
    wire    [3:0]  lc2;
    wire    [3:0]  lm1;
    wire    [3:0]  lm2;
    wire    [3:0]  ln1;
    wire    [3:0]  ln2;

    wire    [3:0]  lout1;
    wire    [3:0]  lout2;


    /**
     * 实例化选择模块
     * 输入：来自四个功能模块
     * 输出：输给给七段数码管
     */
    select u_select(
        .button_add ( b_add ),
        .button_cmp ( b_cmp ),
        .button_max ( b_max ),
        .button_min ( b_min ),

        .add_h      ( la1   ),
        .add_l      ( la2   ),
        .cmp_h      ( lc1   ),
        .cmp_l      ( lc2   ),
        .max_h      ( lm1   ),
        .max_l      ( lm2   ),
        .min_h      ( ln1   ),
        .min_l      ( ln2   ),

        .out_h      ( lout1 ),
        .out_l      ( lout2 )
    );


    // 实例化功能模块
    adder u_adder(
        .add_num1 ( din1  ),
        .add_num2 ( din2  ),
        .add_high ( la1   ),
        .add_low  ( la2   ),
        .add      ( b_add )
    );

    comparator u_comparator(
        .cmp_num1 ( din1  ),
        .cmp_num2 ( din2  ),
        .cmp_high ( lc1   ),
        .cmp_low  ( lc2   ),
        .compare  ( b_cmp )
    );

    mmax u_mmax(
        .max_num1 ( din1  ),
        .max_num2 ( din2  ),
        .max_high ( lm1   ),
        .max_low  ( lm2   ),
        .smax     ( b_max )
    );

    mmin u_mmin(
        .min_num1 ( din1  ),
        .min_num2 ( din2  ),
        .min_high ( ln1   ),
        .min_low  ( ln2   ),
        .smin     ( b_min )
    );


    // 七段数码管
    // 高位
    seven_segment_decoder u_seven_segment_decoder1(
        .din      ( lout1   ),
        .ib_n     ( 1'b1    ),
        .lt_n     ( 1'b1    ),
        .rbi_n    ( 1'b1    ),
        .rbo_n    ( led1    ),
        .seg_out  ( dout1   ),
        .dp_out   ( dp_out1 ),
        .select   ( select1 )
    );

    // 低位
    seven_segment_decoder u_seven_segment_decoder2(
        .din      ( lout2   ),
        .ib_n     ( 1'b1    ),
        .lt_n     ( 1'b1    ),
        .rbi_n    ( 1'b1    ),
        .rbo_n    ( led2    ),
        .seg_out  ( dout2   ),
        .dp_out   ( dp_out2 ),
        .select   ( select2 )
    );

endmodule