module decodificador28bits ( sel,s1, bebida, soma, sensor, cedulaINV, valoramais);
input [2:0]  sel, sensor;
input [1:0] bebida;
input [4:0] soma;
input cedulaINV, valoramais;
output reg [20:0] s1;
 
 
	always @( sel,sensor,bebida) begin
      	case (sel)
          	3'b000: s1=21'b111111111111110110000;
          	3'b001: begin
					//Café expresso
					if (bebida == 2'b00) begin 
						s1=21'b011000101100000010010;
					end
					//Café com leite
					else if (bebida == 2'b01) begin 
						s1=21'b011000111100011001100;
					end
					//Chá de camomila
					else if (bebida == 2'b10) begin 
						s1=21'b011000110010000100100;
					end
					//Cappuccino
					else begin 
						s1=21'b011000110011110000001;
					end
				end
				3'b010: begin
					//Exibe 0
					if (soma == 5'b00000) begin
						s1=21'b111111111111110000001;
					end
					//Exibe 2
					else if (soma == 5'b00010) begin
						s1=21'b111111111111110010010;
					end
					//Exibe 4
					else if (soma == 5'b00100) begin
						s1=21'b111111111111111001100;
					end
					//Exibe 5
					else if (soma == 5'b00101) begin
						s1=21'b111111111111110100100;
					end
					//Exibe 6
					else if (soma == 5'b00110) begin
						s1=21'b111111111111110100000;
					end
					//Exibe 7
					else if (soma == 5'b00111) begin
						s1=21'b111111111111110001111;
					end
					//Exibe 8
					else if (soma == 5'b01000) begin
						s1=21'b111111111111110000000;
					end
					//Exibe 9
					else if (soma == 5'b01001) begin
						s1=21'b111111111111110000100;
					end
					//Exibe 10
					else if (soma == 5'b01010) begin
						s1=21'b111111110011110000001;
					end
					else if (valoramais == 1'b1) begin
						s1=21'b110000011110010100001;
					end
					else begin
						s1=21'b011000110011111111111;
					end
				end
				
          	3'b011: s1=21'b111111111111111111111; // bombagem
          	3'b100: s1=21'b111111111111111111111; // aquecimento
          	3'b101: s1=21'b111111111111111111111; // entrega
				
          	3'b110: begin	// Erro Sensor
					// apresenta nada
					if (sensor == 3'b000) begin
						s1=21'b111111111111111111111;
						end
					//Sensor agua
					else if (sensor == 3'b001) begin
						s1=21'b111111111111110001000;
					end
					//Sensor capsula
					else if (sensor == 3'b010) begin
						s1=21'b111111100110001111111;
					end
					//Sensor copo
					else if (sensor == 3'b100) begin
						s1=21'b011000011111111111111;
					end
					//Sensor capsula e agua
					else if (sensor == 3'b011) begin
						s1=21'b111111100110000001000;
					end
					//Sensor copo e agua
					else if (sensor == 3'b101) begin
						s1=21'b011000111111110001000;
					end
					//Sensor copo e capsula 
					else if (sensor == 3'b110) begin
						s1=21'b011000100110001111111;
					end
					//Os 3 sensores
					else begin
						s1=21'b011000100110000001000;
					end
					end
          	3'b111: begin 

				//Exibe 0 e um D
					if (soma == 5'b00000) begin
						s1=21'b100001011111110000001;
					end
					//Exibe 2 e um D
					else if (soma == 5'b00010) begin
						s1=21'b100001011111110010010;
					end
					//Exibe 4 e um D
					else if (soma == 5'b00100) begin
						s1=21'b100001011111111001100;
					end
					//Exibe 5 e um D
					else if(soma == 5'b00101) begin
						s1=21'b100001011111110100100;
					end
					//Exibe 6 e um D
					else if (soma == 5'b00110) begin
						s1=21'b100001011111110100000;
					end
					//Exibe 7 e um D
					else if (soma == 5'b00111) begin
						s1=21'b100001011111110001111;
					end
					//Exibe 8 e um D
					else if (soma == 5'b01000) begin
						s1=21'b100001011111110000000;
					end
					//Exibe 9 e um D
					else if (soma == 5'b01001) begin
						s1=21'b100001011111110000100;
					end
					//Exibe 10 e um D
					else if (soma == 5'b01010) begin
						s1=21'b1000010110011110000001;
					end
					else begin
						s1=21'b100001011111101111110;
					end
				end
				default s1=21'b111111111111111111111;
      	endcase
  	end
endmodule
/*	else begin
						s1 = 28'b0110000110101011010100000001;
					end*/
