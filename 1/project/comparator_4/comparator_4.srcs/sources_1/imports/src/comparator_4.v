/*
 * ��λ���ݱȽ���
 *
 * ���룺����4λ������A��SW7-SW4��������B��SW3-SW0��
 * �����3λ��LD2 2-0��
 */


module comparator_4(
    din1,  // ����A(SW7-SW4)
    din2,  // ����B(SW3-SW0)
    dout   // ���(LD2 2-0)
);

    input        [3:0]  din1;  // A: SW7-SW4
    input        [3:0]  din2;  // B: SW3-SW0
    output  reg  [2:0]  dout;

    always @(*)
    begin
        if (din1 > din2)
            begin
                dout = 3'b100;
            end
        else if (din1 < din2)
            begin
                dout = 3'b001;
            end
        else
            begin
                dout = 3'b010;
            end
    end

endmodule
