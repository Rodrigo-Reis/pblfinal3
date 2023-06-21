module ErrMoeda (bebida, moedaINV, moedaNCORRESPONDE, soma, clock);

	input [1:0] bebida;
	input [4:0] soma;
	output reg moedaINV, moedaNCORRESPONDE;
	input clock;

	
	parameter produto1 = 5'b00010; // 2 reais
	parameter produto2 = 5'b00100; // 4 reais 
	parameter produto3 = 5'b00101; // 5 reais
	parameter produto4 = 5'b01010; // 10 reais
	
	always @ (posedge clock) begin
		if (soma == 5'b11111)	begin 
				moedaINV = 1'b1;
				moedaNCORRESPONDE = 1'b0;
			end
		else if ( bebida == 2'b00 && produto1 == soma) begin
			moedaNCORRESPONDE = 1'b0;
			moedaINV = 1'b0;
			end		
		else if(bebida ==	2'b01 && produto2 == soma) begin 
					moedaNCORRESPONDE = 1'b0;
					moedaINV = 1'b0;
			end
		else if (bebida == 2'b10 && produto3 == soma) begin
					moedaNCORRESPONDE = 1'b0;
					moedaINV = 1'b0;
			end
		else if (bebida == 2'b11&& produto4 == soma) begin
					moedaNCORRESPONDE = 1'b0;
					moedaINV = 1'b0;
			end
		else begin
				moedaNCORRESPONDE = 1'b1;
				moedaINV = 1'b0;
			end
	end	
	
endmodule
