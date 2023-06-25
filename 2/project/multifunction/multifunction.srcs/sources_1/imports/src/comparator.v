/*
 * �Ƚ�ģ��
 *
 * ���룺����4λ��������
 * �����2λ�ȽϽ��
 */


module comparator(
    cmp_num1,  // ����A
    cmp_num2,  // ����B
    cmp_high,  // �����λ
    cmp_low ,  // �����λ
    compare    // ѡ��ȽϹ���
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