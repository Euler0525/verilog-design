/*
 * �߶������
 *
 * ���룺4λ��SW3-SW0��
 *      ����źţ�����Ч�����ȼ���ߣ�SW7��
 *      ����źţ�����Ч�����ȼ��ڶ���SW6��
 *      �����ź����루����Ч��SW5��
 * ����������ź����������Ч��LD2 0��
 *      ��ʾ��������ֺ�С���㣩
 *      λѡ�źţ�BIT8 G6��
 */


// �͵�ƽ��Ч
module seven_segment_decoder(
    din    ,  // 4λ����
    ib_n   ,  // ����ź�1
    lt_n   ,  // ����ź�2
    rbi_n  ,  // �����ź�����
    rbo_n  ,  // �����ź����
    seg_out,  // �߶��������ʾ���
    dp_out ,  // С������ʾ�ź�
    select    // λѡ�ź�
);

    input        [3:0]  din    ;  // 4λ����
    input               ib_n   ;  // ����ź�1`
    input               lt_n   ;  // ����ź�2`
    input               rbi_n  ;  // �����ź�����
    output  reg         rbo_n  ;  // �����ź����
    output  reg  [6:0]  seg_out;  // �߶����������ź�
    output  reg         dp_out ;  // С������ʾ�ź�
    output  reg         select = 1'b1;  // λѡ�ź�

    // rbo_n
    always @(*)
    begin
        if (ib_n == 1'b0)
            begin
                rbo_n = 1'b1;
            end
        else if (lt_n == 1'b0)
            begin
                rbo_n = 1'b1;
            end
        // ����
        else if ((rbi_n == 1'b0) && (din == 4'b0000))
            begin
                rbo_n = 1'b0;
            end
        else
            begin
                rbo_n = 1'b1;
            end
    end

    // seg_out
    always @(*)
    begin
        // ���
        if (ib_n == 1'b0)
            begin
                seg_out = 7'b0000000;
            end
        // ���
        else if (lt_n == 1'b0)
            begin
                seg_out = 7'b1111111;
            end
        // ����
        else if ((rbi_n == 1'b0) && (din == 4'b0000))
            begin
                seg_out = 7'b0000000;
            end
        // ������ʾ����
        else
            begin
                case (din)
                    //       seg_out = 7'bABCDEFG
                    4'b0000: seg_out = 7'b1111110;
                    4'b0001: seg_out = 7'b0110000;
                    4'b0010: seg_out = 7'b1101101;
                    4'b0011: seg_out = 7'b1111001;
                    4'b0100: seg_out = 7'b0110011;
                    4'b0101: seg_out = 7'b1011011;
                    4'b0110: seg_out = 7'b1011111;
                    4'b0111: seg_out = 7'b1110000;
                    4'b1000: seg_out = 7'b1111111;
                    4'b1001: seg_out = 7'b1110011;
                    4'b1010: seg_out = 7'b0001101;
                    4'b1011: seg_out = 7'b0011001;
                    4'b1100: seg_out = 7'b0100011;
                    4'b1101: seg_out = 7'b1001011;
                    4'b1110: seg_out = 7'b0001111;
                    4'b1111: seg_out = 7'b0000000;
                    default  seg_out = 7'b0000000;
                endcase
            end
    end

    // dp_out
    always @(*)
    begin
        // ���
        if (ib_n == 1'b0)
            begin
                dp_out = 1'b0;
            end
        // ���
        else if (lt_n == 1'b0)
            begin
                dp_out = 1'b1;
            end
        // ����
        else if ((rbi_n == 1'b0) && (din == 4'b0000))
            begin
                dp_out = 1'b0;
            end
        else
            begin
                dp_out = 1'b0;
            end
    end

endmodule
