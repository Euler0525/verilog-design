/*
 * ��Сֵģ��
 *
 * ���룺����4λ��������
 * �������Сֵ
 */


module mmin(
    min_num1,  // ����A
    min_num2,  // ����B
    min_high,  // ����
    min_low ,  // ��Сֵ���
    smin       // ѡ����Сֵ����
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