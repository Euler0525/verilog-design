/*
 * 比较模块
 *
 * 输入：两个4位二进制数
 * 输出：2位比较结果
 */


module comparator(
    cmp_num1,  // 数据A
    cmp_num2,  // 数据B
    cmp_high,  // 结果高位
    cmp_low ,  // 结果低位
    compare    // 选择比较功能
);

    input        [3:0]  cmp_num1;
    input        [3:0]  cmp_num2;
    output  reg  [3:0]  cmp_high;
    output  reg  [3:0]  cmp_low ;
    input               compare;

    always @(*)
    begin
        if (cmp_num1 > cmp_num2)
            begin
                cmp_high = 4'b0001;
            end
        else if (cmp_num1 < cmp_num2)
            begin
                cmp_high = 4'b0000;
            end
        else
            begin
                cmp_high = 4'b0001;
            end
    end

    always @(*)
    begin
        if (cmp_num1 > cmp_num2)
            begin
                cmp_low = 4'b0000;
            end
        else if (cmp_num1 < cmp_num2)
            begin
                cmp_low = 4'b0001;
            end
        else
            begin
                cmp_low = 4'b0001;
            end
    end

endmodule