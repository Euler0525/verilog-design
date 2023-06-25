`include "scan_display.v"
`include "seven_segment_decoder.v"

module scan_top(
    clk    ,
    rst_n  ,

    select ,

    rbo_n  ,  // �����ź����
    seg_out,  // �߶��������ʾ���
    dp_out    // С������ʾ�ź�
);
    input          clk    ;
    input          rst_n  ;

    output  [3:0]  select ;

    output         rbo_n  ;
    output  [6:0]  seg_out;
    output         dp_out ;

    wire    [3:0]  segment;

    scan_display u_scan_display(
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .select  ( select  ),
        .segment ( segment )
    );

    seven_segment_decoder u_seven_segment_decoder(
        .din     ( segment   ),
        .ib_n    ( 1'b1      ),
        .lt_n    ( 1'b1      ),
        .rbi_n   ( 1'b1      ),
        .rbo_n   ( rbo_n     ),
        .seg_out ( seg_out   ),
        .dp_out  ( dp_out    )
    );


endmodule
