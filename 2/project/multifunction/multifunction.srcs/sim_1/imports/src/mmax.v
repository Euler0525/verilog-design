/*
 * 最大值模块
 *
 * 输入：两个4位二进制数
 * 输出：最大值
 */


module mmax(
    max_num1,  // 数据A
    max_num2,  // 数据B
    max_high,  // 置零
    max_low ,  // 最大值结果
    smax       // 选择最大值功能
);

    input        [3:0]  max_num1;
    input        [3:0]  max_num2;
    output  reg  [3:0]  max_high = 4'b0000;
    output  reg  [3:0]  max_low ;
    input               smax    ;

    always @(*)
    begin
        if (max_num1 > max_num2)
            begin
                max_low = max_num1;
            end
        else
            begin
                max_low = max_num2;
            end
    end

endmodule