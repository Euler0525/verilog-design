`include "select.v"
`include "mmin.v"
`include "mmax.v"
`include "adder.v"
`include "comparator.v"
`include "seven_segment_decoder.v"

module multifunction(
    din1   ,  // ����A
    din2   ,  // ����B

    b_add  ,  // ��Ͱ�ť
    b_cmp  ,  // �Ƚϰ�ť
    b_max  ,  // ���ֵ��ť
    b_min  ,  // ��Сֵ��ť

    dout1  ,  // ��λ���
    dout2  ,  // ��λ���
    dp_out1,  // ��λС����
    dp_out2,  // ��λС����

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

    // �м�������洢������ģ�����
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
     * ʵ����ѡ��ģ��
     * ���룺�����ĸ�����ģ��
     * �����������߶������
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


    // ʵ��������ģ��
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


    // �߶������
    // ��λ
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

    // ��λ
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