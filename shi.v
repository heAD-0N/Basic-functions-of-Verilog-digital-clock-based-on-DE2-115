module shi(qout,ah,reset,clk,cin,naozhong,nout);
input clk,reset,ah,cin,naozhong;
output reg[7:0] qout;
output reg[7:0] nout;
always@(posedge clk or posedge reset)
begin
	if(reset) qout=0;
	else if((~naozhong)&&(~ah||cin))
	begin
   if(qout==23) qout=0;
	        else qout=qout+1;end 

end

always@(negedge ah)
begin
	if(naozhong)
	begin
	if(nout==23) begin nout=0;end
		     else nout=nout+1;end
end

endmodule