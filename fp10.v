module fp10(
    input wire clk_in,    // 输入 50 MHz 时钟
    output reg clk_out    // 输出 10 Hz 时钟
);

    reg [22:0] counter;   // 计数器，计数到 5,000,000（2^23足够）

    always @(posedge clk_in) begin
        if (counter == 5000000 - 1) begin
            counter <= 0;          // 计数器清零
            clk_out <= ~clk_out;   // 翻转输出时钟
        end
        else begin
            counter <= counter + 1; // 计数器加一
        end
    end

endmodule
