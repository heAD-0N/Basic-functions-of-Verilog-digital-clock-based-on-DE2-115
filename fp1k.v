module fp1k(
    input wire clk_50MHz,    // 50 MHz 时钟输入
    output reg clk_1kHz      // 1 kHz 时钟输出
);

    reg [15:0] counter;      // 16位计数器（最大可计数65535）

    always @(posedge clk_50MHz) begin
        if (counter == 16'd49999) begin // 当计数器到达49999时翻转时钟
            counter <= 16'd0;
            clk_1kHz <= ~clk_1kHz;  // 翻转1 kHz时钟信号
        end
        else begin
            counter <= counter + 16'd1;  // 继续计数
        end
    end

endmodule
