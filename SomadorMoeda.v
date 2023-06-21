module SomadorMoeda (chmoeda, botao, soma, clock, Cedula_inv, valorultrapassou, on_off);

	input botao,clock, on_off;
	input [1:0] chmoeda;
	output reg [4:0] soma;
	output reg Cedula_inv, valorultrapassou;
	
	
	initial begin
		soma <= 5'b00000;
	end
	//
	
	always @ (posedge clock) begin
		if (on_off) begin
			if (soma > 5'b01010) begin
				valorultrapassou <= 1'b1;
			end
			else if (botao && chmoeda == 2'b00) begin
				Cedula_inv <= 1'b1;
			end
			else if (botao && chmoeda == 2'b01) begin
				soma <= soma + 5'b00010;
			end
			else if (botao && chmoeda == 2'b10) begin
				soma <= soma + 5'b00101;
			end
			else if (botao && chmoeda == 2'b11) begin
				soma <= soma + 5'b01010;
			end
		end
		else begin
			soma <= 5'b00000;
			end
		end
endmodule 



			/*if (soma > 5'b01010) begin
				soma <= 5'b00000;
			end
			else if (botao && ch2 == 1'b0 && ch1 == 1'b0) begin
				soma <= soma + 5'b00000;
			end
			else if (botao && ch2 == 1'b0 && ch1 == 1'b1) begin
				soma <= soma + 5'b00010;
			end
			else if (botao && ch2 == 1'b1 && ch1 == 1'b0) begin
				soma <= soma + 5'b00101;
			end
			else if (botao && ch2 == 1'b1 && ch1 == 1'b1) begin
				soma <= soma + 5'b01010;*/