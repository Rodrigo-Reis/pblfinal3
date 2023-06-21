module DEMUX4X1  (enable, bits, saidas);
	
	input enable;
	input [1:0] bits;
	output reg [3:0] saidas;
	
	always @ (enable, bits) begin
		if (!enable)
			saidas <= 4'b0000;
		else begin
			case (bits)
				2'b00: saidas <= 4'b1110;
				2'b01: saidas <= 4'b1101;
				2'b10: saidas <= 4'b1011;
				2'b11: saidas <= 4'b1111;
			endcase 
	end
	end
endmodule
