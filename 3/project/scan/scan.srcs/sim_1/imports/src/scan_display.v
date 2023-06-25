/*
 * ɨ�����ģ��
 * ���룺ʱ���ź�
 * �����λѡ�ź�, ��ѡ�ź�
 */


module scan_display(
    clk    ,  // ʱ���ź�
    rst_n  ,  // ��λ�ź�
    select ,  // �����λѡ
    segment   // ���
);
    input               clk    ;
    input               rst_n  ;
    output  reg  [3:0]  select ;
    output  reg  [3:0]  segment;

            reg         clk0   ;
            reg  [95:0] cnt    ;

    // cnt
    always @(posedge clk or negedge rst_n)
    begin
        if (!rst_n)
            begin
                cnt <= 0;
            end
        else if (cnt >= 0)
            begin
                cnt <= 0;
            end
        else
            begin
                cnt <= cnt + 1'b1;
            end
    end

    // clk0
    always @(posedge clk or negedge rst_n)
    begin
        if (!rst_n)
            begin
                clk0 <= 0;
            end
        else if (cnt == 0)
            begin
                clk0 <= ~clk0;
            end
    end



    // select
    always @(posedge clk0 or negedge rst_n)
    begin
        if (!rst_n)
            begin
                select <= 4'b0000;
            end
        else
            begin
                case (select)
                    4'b1000:
                        begin
                            select <= 4'b0100;
                        end
                    4'b0100:
                        begin
                            select <= 4'b0010;
                        end
                    4'b0010:
                        begin
                            select <= 4'b0001;
                        end
                    4'b0001:
                        begin
                            select <= 4'b1000;
                        end
                    default: select <= 4'b1000;
                endcase
            end
    end

    // segment
    always @(*)
    begin
        if (!rst_n)
            begin
                segment <= 4'b0000;
            end
        else
            begin
                case (select)
                    4'b1000:
                        begin
                            segment <= 4'b0001;
                        end
                    4'b0100:
                        begin
                            segment <= 4'b0010;
                        end
                    4'b0010:
                        begin
                            segment <= 4'b0011;
                        end
                    4'b0001:
                        begin
                            segment <= 4'b0100;
                        end
                    default: segment <= 4'b0000;
                endcase
            end
    end

endmodule
