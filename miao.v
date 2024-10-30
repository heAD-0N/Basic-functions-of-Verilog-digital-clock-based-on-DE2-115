module miao(qout,reset,clk,cin,secin1,cout);
input clk,reset,cin;
input [7:0] secin1;
output reg[7:0] qout;
output cout;
always@(posedge clk or posedge reset)
begin
	if(reset) qout=0;
	else if(cin)
	begin
   if(qout==59) begin qout=0;end
	        else qout=qout+1;end 
end
assign cout=((qout==59)&&(secin1==4))?1:0;
endmodule
