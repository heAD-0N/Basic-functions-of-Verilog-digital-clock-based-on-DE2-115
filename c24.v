module c24(mode,qout,ah,cout,reset,clk);
input clk,reset,mode,ah;
output reg[7:0] qout;
output cout;

always@(posedge clk or negedge ah or posedge reset or negedgel mode)
begin
if(reset) qout<=0;

else begin

if(~mode)
begin
if(qout[3:0]==3)
begin 
if (qout[7:4]==2)
begin qout[3:0]=0;qout[7:4]=0;end
else qout[3:0]=qout[3:0]+1;
end
else 
begin
if(qout[3:0]==9) begin qout[7:4]<=qout[7:4]+1;qout[3:0]=0;end
else qout[3:0]=qout[3:0]+1;
end
end

else
begin
if(ah==0)
begin
if(qout[3:0]==3)
begin 
if (qout[7:4]==2)
begin qout[3:0]=0;qout[7:4]=0;end
else qout[3:0]=qout[3:0]+1;
end
else 
begin
if(qout[3:0]==9) begin qout[7:4]<=qout[7:4]+1;qout[3:0]=0;end
else qout[3:0]=qout[3:0]+1;
end
end
end
end
end
assign cout=(qout==8'd23)?1:0;
endmodule