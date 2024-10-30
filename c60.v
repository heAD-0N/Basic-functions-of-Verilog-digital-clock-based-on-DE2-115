module c60(mode,qout,cout,reset,clk);
input clk,reset,mode;
output reg[7:0] qout;
output cout;
always@(posedge clk)
begin
if(reset) qout<=0;
else if(mode==0) 
begin
if(qout[3:0]==9)
begin qout[3:0]=0;
if (qout[7:4]==5)
qout[7:4]=0;else qout[7:4]<=qout[7:4]+1;
end
else qout[3:0]=qout[3:0]+1;
end
end
assign cout=(qout==8'd59)?1:0;
endmodule