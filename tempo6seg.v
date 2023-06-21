module tempo6seg(clock, on_off, s);

	input clock, on_off;
	output s;
	reg [2:0] bit;

	
	
	always @(posedge clock) begin
		if (!on_off) 
			bit <= 3'b000;
		else begin
			if (bit == 3'b110)
				bit <= 3'b000;
			bit <= bit + 1;
		end			
	end
	
	assign s = bit[2] && bit[1] && !bit[0];

endmodule 