`include "scan_display.v"
`include "seven_segment_decoder.v"

module scan_top(
    clk    ,
    rst_n  ,

    select ,

    rbo_n  ,  // 灭零信号输出
    seg_out,  // 七段数码管显示输出
    dp_out    // 小数点显示信号
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
