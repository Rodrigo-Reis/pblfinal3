module tempo10seg(clock, on_off, s);

	input clock, on_off;
	output s;
	reg [3:0] bit;

	//temporizador de 10 segundos
	
	always @(posedge clock) begin
		if (!on_off) 
			bit <= 4'b0000;
		else begin
			if (bit == 4'b1010)
				bit <= 4'b0000;
			bit <= bit + 1;
		end			
	end
	
	assign s = bit[3] && !bit[2] && bit[1] && !bit[0];

endmodule 