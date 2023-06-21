module tempo2seg(clock, on_off, s);

	input clock, on_off;
	output s;
	reg [1:0] bit;


	
	always @(posedge clock) begin
		if (!on_off) 
			bit <= 2'b00;
		else begin
			if (bit == 2'b10)
				bit <= 2'b00;
			bit <= bit + 1;
		end			
	end
	
	assign s = bit[1] && !bit[0];

endmodule 