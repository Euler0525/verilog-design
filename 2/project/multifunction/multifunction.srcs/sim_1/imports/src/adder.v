/*
 * 求和模块
 *
 * 输入：两个4位二进制数
 * 输出：两数之和
 */


module adder(
    add_num1,  // 数据A
    add_num2,  // 数据B
    add_high,  // 十位
    add_low ,  // 个位
    add        // 选择求和功能按钮
);
    input        [3:0]  add_num1;
    input        [3:0]  add_num2;
    output  reg  [3:0]  add_high;
    output  reg  [3:0]  add_low ;
    input               add     ;
            reg  [7:0]  expand  ;

    always @(*)
    begin
        expand = {4'b0000, add_num1} + {4'b0000, add_num2};
        if (expand > 8'b00011101)
            begin
                {add_high, add_low} = expand + 8'b00010010;
            end
        else if (expand > 8'b00010011)
            begin
                {add_high, add_low} = expand + 8'b00001100;
            end
        else if (expand > 8'b00001001)
            begin
                {add_high, add_low} = expand + 8'b00000110;
            end
        else
            begin
                {add_high, add_low} = expand              ;
            end
    end

endmodule