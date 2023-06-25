/*
 * 扫描控制模块
 * 输入：时钟信号
 * 输出：位选信号, 段选信号
 */


module scan_display(
    clk    ,  // 时钟信号
    rst_n  ,  // 复位信号
    select ,  // 数码管位选
    segment   // 输出
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
        else if (cnt >= 32)
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
        else if (cnt == 32)
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
