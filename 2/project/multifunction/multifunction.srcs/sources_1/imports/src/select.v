/*
 * 功能选择模块
 *
 * 输入：选择按钮
 * 输出：8位结果，传送给七段译码管模块
 */


module select(
    // 选择按钮
    button_add,
    button_cmp,
    button_max,
    button_min,

    // 模块输出
    add_h     ,
    add_l     ,
    cmp_h     ,
    cmp_l     ,
    max_h     ,
    max_l     ,
    min_h     ,
    min_l     ,

    // 输出
    out_h     ,
    out_l     ,
);

    input         button_add;
    input         button_cmp;
    input         button_max;
    input         button_min;

    input  [3:0]  add_h;
    input  [3:0]  add_l;
    input  [3:0]  cmp_h;
    input  [3:0]  cmp_l;
    input  [3:0]  max_h;
    input  [3:0]  max_l;
    input  [3:0]  min_h;
    input  [3:0]  min_l;

    output  reg  [3:0]  out_h;
    output  reg  [3:0]  out_l;

    always @(*)
    begin
        if (button_add == 1'b1)
            begin
                {out_h, out_l} = {add_h, add_l};
            end
        else if (button_cmp == 1'b1)
            begin
                {out_h, out_l} = {cmp_h, cmp_l};
            end
        else if (button_max == 1'b1)
            begin
                {out_h, out_l} = {max_h, max_l};
            end
        else if (button_min == 1'b1)
            begin
                {out_h, out_l} = {min_h, min_l};
            end
        else
            begin
                {out_h, out_l} = 8'b00000000;
            end
    end

endmodule