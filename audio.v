module audio(
    input wire clk,           // FPGA时钟信号 (假设50MHz)
    input wire reset,         // 复位信号
    output wire pwm_out       // PWM音频输出信号
);

    // 产生的音频信号频率，定义几个音符频率
    parameter C4 = 261; 
    parameter D4 = 293;  
    parameter E4 = 329;
	 parameter F4 = 349; 
    parameter G4 = 392;  
    parameter A4 = 440; 
	 parameter B4 = 493;
	 parameter E_DI = 82; 
	 parameter FS = 93;

    // 50MHz时钟频率
    parameter CLK_FREQ = 50000000;
    
    reg [31:0] counter;
    reg [31:0] pwm_duty_cycle;  // 占空比控制信号

    // 用于存储当前音符的频率
    reg [31:0] note_freq;
    reg [31:0] note_duration_counter;
    reg [3:0] note_index;  // 当前音符索引

    // 音符序列和持续时间 (可根据实际音乐曲目调整)
    reg [31:0] note_table[16:0];
    reg [31:0] duration_table[16:0];

    initial begin
        // 定义音符频率
        note_table[0] = D4;
        note_table[1] = G4;
        note_table[2] = B4;
        note_table[3] = G4;
        note_table[4] = A4;
        note_table[5] = D4;
        note_table[6] = E4;
        note_table[7] = B4;
		  note_table[8] = G4;
        note_table[9] = E_DI;
        note_table[10] = D4;
        note_table[11] = B4;
        note_table[12] = G4;
        note_table[13] = E_DI;
        note_table[14] = B4;
        note_table[15] = FS;
		  note_table[16] = B4;

        // 定义每个音符的持续时间
        duration_table[0] = 20000000;  
        duration_table[1] = 20000000;  
        duration_table[2] = 20000000; 
        duration_table[3] = 20000000;  
        duration_table[4] = 20000000;  
        duration_table[5] = 10000000;  
        duration_table[6] = 10000000; 
        duration_table[7] = 20000000;
		  duration_table[8] = 20000000;  
        duration_table[9] = 20000000;  
        duration_table[10] = 20000000; 
        duration_table[11] = 20000000;  
        duration_table[12] = 20000000;  
        duration_table[13] = 20000000;  
        duration_table[14] = 20000000; 
        duration_table[15] = 20000000;
		  duration_table[16] = 20000000;  
    end

    // PWM占空比计算
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            pwm_duty_cycle <= 0;
        end else begin
            // 产生音频信号 (PWM占空比)
            if (counter >= CLK_FREQ / note_freq) begin
                counter <= 0;
                pwm_duty_cycle <= ~pwm_duty_cycle;
            end else begin
                counter <= counter + 1;
            end
        end
    end

    // 控制音符播放时间
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            note_index <= 0;
            note_freq <= note_table[0];
            note_duration_counter <= 0;
        end else begin
            // 当音符持续时间结束时切换到下一个音符
            if (note_duration_counter >= duration_table[note_index]) begin
                note_duration_counter <= 0;
                note_index <= (note_index + 1) % 8;  // 循环播放8个音符
                note_freq <= note_table[note_index];
            end else begin
                note_duration_counter <= note_duration_counter + 1;
            end
        end
    end

    // 输出PWM信号
    assign pwm_out = pwm_duty_cycle;

endmodule
