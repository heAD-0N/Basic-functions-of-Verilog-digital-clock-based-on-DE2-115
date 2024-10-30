module alarm(en,clk,reset,cin,set,shi,daodian,min,miao);
input [7:0] shi;
input [7:0] min;
input [7:0] miao;
input reset,cin,clk,en;
output reg[7:0] set;
output daodian;
always@(posedge clk or posedge reset)
begin
	if(reset) set=0;
	else 
	begin 
		if(set==23)
		set=0;
		else if(~cin) 
		set<=set+1;
	end
end
assign daodian=(en&&(min==8'b0)&&(miao < 10))?1:0;
endmodule