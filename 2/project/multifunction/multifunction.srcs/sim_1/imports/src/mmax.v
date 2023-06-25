/*
 * ���ֵģ��
 *
 * ���룺����4λ��������
 * ��������ֵ
 */


module mmax(
    max_num1,  // ����A
    max_num2,  // ����B
    max_high,  // ����
    max_low ,  // ���ֵ���
    smax       // ѡ�����ֵ����
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