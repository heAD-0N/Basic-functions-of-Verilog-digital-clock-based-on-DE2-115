module miao10(clk10, cout, qout);
input clk10;
output cout;
output reg [7:0] qout;

always@(posedge clk10) begin
   if(qout == 4) 
      qout <= 0;
   else 
      qout <= qout + 1;
end

assign cout = (qout == 4) ? 1 : 0;
endmodule
