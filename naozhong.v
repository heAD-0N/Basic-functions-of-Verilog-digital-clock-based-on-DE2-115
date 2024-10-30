module naozhong(
    input wire [7:0] shi_nao,
    input wire [7:0] shi_date,
	 input wire [7:0] fen_nao,
    input wire [7:0] fen_date,
    input wire switch, clk,
    output reg audio
);
    
    reg en_reg;
	 reg alarm_enabled = 1;

    always @(posedge clk)
    begin
        if (switch)
		  begin
            en_reg <= 1;
		  end
        else
            en_reg <= 0;
    end
	 
	 always @(posedge switch)
    begin
        alarm_enabled = !alarm_enabled;
    end
    
    always @(posedge clk)
    begin
        if (alarm_enabled && en_reg && (shi_nao == shi_date)&&(fen_nao == fen_date))
            audio <= 1; 
        else
            audio <= 0;
    end

endmodule
