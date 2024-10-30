module display(qin,sig);
input[3:0] qin;
output reg [0:6]sig;
always@(qin)
begin case(qin)
4'd0:sig=7'b0000001;
4'd1:sig=7'b1001111;
4'd2:sig=7'b0010010;
4'd3:sig=7'b0000110;
4'd4:sig=7'b1001100;
4'd5:sig=7'b0100100;
4'd6:sig=7'b0100000;
4'd7:sig=7'b0001111;
4'd8:sig=7'b0000000;
4'd9:sig=7'b0000100;
default:sig=7'b0000001;
endcase
end 
endmodule 