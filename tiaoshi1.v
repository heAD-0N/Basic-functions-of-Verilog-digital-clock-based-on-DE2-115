module tiaoshi1(mode,qout,ah,hour);
input [7:0] qout;
input mode,ah;
output reg[7:0] hour;
always @(*)
if(mode==1)
begin
if(ah==0) begin
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
endmodule