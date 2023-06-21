module FFD (d, rstn, clk, q);  
   
	output reg q; 
	input d, rstn, clk;
	
	always @ (posedge clk or negedge rstn)  
		if (!rstn)  
			q <= 0;  
		else  
			q <= d;
endmodule  