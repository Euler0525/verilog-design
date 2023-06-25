/*
 * 最小值模块
 *
 * 输入：两个4位二进制数
 * 输出：最小值
 */


module mmin(
    min_num1,  // 数据A
    min_num2,  // 数据B
    min_high,  // 置零
    min_low ,  // 最小值结果
    smin       // 选择最小值功能
);

    input        [3:0]  min_num1;
    input        [3:0]  min_num2;
    output  reg  [3:0]  min_high = 4'b0000;
    output  reg  [3:0]  min_low ;
    input               smin    ;

    always @(*)
    begin
        if (min_num1 < min_num2)
            begin
                min_low = min_num1;
            end
        else
            begin
                min_low = min_num2;
            end
    end

endmodule