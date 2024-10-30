module fen(qout,am,reset,clk,cin,cout,nout,secin,secin1,naozhong);
input clk,reset,am,cin,naozhong;
input [7:0] secin;
input [7:0] secin1;
output reg[7:0] qout;
output reg[7:0] nout;
output   cout;
always@(posedge clk or posedge reset)
begin
	if(reset) qout=0;
	else if((~naozhong)&&(~am||cin))
	begin
   if(qout==59) begin qout=0;end
	        else qout=qout+1;end 
end

always@(negedge am)
begin
	if(naozhong)
	begin
	if(nout==59) begin nout=0;end
		     else nout=nout+1;end
end

assign cout=((qout==59)&&(secin==59)&&(secin1==4))?1:0;
endmodule