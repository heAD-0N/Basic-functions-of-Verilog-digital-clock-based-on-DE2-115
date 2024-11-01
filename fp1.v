module fp1(clk50m,cp1hz);
input wire clk50m;
output reg cp1hz;
reg [25:0] count;
always@(posedge clk50m)
begin
if(count==(25000000-1))
begin
count<=0;
cp1hz<=~cp1hz;
end
else
count<=count+1;
end
endmodule