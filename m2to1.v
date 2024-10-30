module m2to1 (
   input wire a,    
	input wire b, 	 
   input wire sel,  
   output wire y   
);
    assign y = (sel) ? a : b;

endmodule