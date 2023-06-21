module MaquinadeEstados (B0, 
	ErrSensor, ErrMoeda, 
	T10_bebida, T10_moeda, 
	T2_pressu, T10_aqueci, T2_entre, T6_errMoeda,
	T6_sensor, clock, ATUAL,
	sec10_bebida, sec10_moeda, 
	sec2_pressu, sec10_aqueci, sec2_entre, sec6_errMoeda,
	sec6_sensor, rgb_green, rgb_blue, rgb_red, on_off);

	input clock,
	B0, 
	ErrSensor, ErrMoeda, 
	T10_bebida, T10_moeda, 
	T2_pressu, T10_aqueci, T2_entre, T6_errMoeda,
	T6_sensor; 
	
	output  reg [2:0] ATUAL;
	
	output reg sec10_bebida, sec10_moeda, 
	sec2_pressu, sec10_aqueci, sec2_entre, sec6_errMoeda,
	sec6_sensor,rgb_green, rgb_blue, rgb_red,on_off;
	
	
	
	parameter ESPERA = 3'b000 // espera
				,ESCOLHA = 3'b001 // escolha
				,VALOR = 3'b010 // valor			
				,BOMBAGEM = 3'b011 // bombagem
				,AQUECIMENTO = 3'b100 // aquecimento
				,ENTREGA = 3'b101 // entrega			
				,ERRO_SENSOR = 3'b110 
				,ERRO_MOEDA = 3'b111;
	
				
	
	reg [2:0] estados;
	
	initial begin
		estados <= ESPERA;
	end
	
	always @ (posedge clock) begin
		case (estados)
			ESPERA: begin
				if(B0==1'b0) estados <= ESPERA;
				
				else estados <= ESCOLHA;
			end
			
			ESCOLHA: begin 
			
				if(ErrSensor==1'b1) estados <= ERRO_SENSOR;

				else if(B0==1'b1 && T10_bebida==1'b0) estados <= VALOR;
				
				else if(T10_bebida==1'b1) estados <= ESPERA;			
			end
			
			VALOR: begin

				if( ErrSensor==1'b1) estados <= ERRO_SENSOR;
				
				else if(B0==1'b1 && ErrSensor==1'b0 && ErrMoeda==1'b1) estados <= ERRO_MOEDA;
				
				else if(T10_moeda==1'b1) estados <= ESPERA;
				
				else if(B0==1'b1 && T10_moeda==1'b0 && ErrSensor==1'b0 && ErrMoeda==1'b0) estados <= BOMBAGEM;
				
				end
			
			BOMBAGEM: begin 		
				if(T2_pressu==1'b0) estados <= BOMBAGEM;
				
				else if(T2_pressu==1'b1) estados <= AQUECIMENTO;
								
				end
			
			AQUECIMENTO: begin 
				if(T10_aqueci==1'b0) estados <= AQUECIMENTO;
				
				else if(T10_aqueci==1'b1) estados <= ENTREGA;
				
				end 
			
			ENTREGA: begin 
				if(T2_entre==1'b0) estados <= ENTREGA;
				
				else if(T2_entre==1'b1) estados <= ESPERA;
				end 
			
			ERRO_SENSOR: begin 
				if(T6_sensor==1'b0) estados <= ERRO_SENSOR;
				
				else if(T6_sensor==1'b1) estados <= ESPERA;
				
			end
				
			ERRO_MOEDA: begin
				if(T6_errMoeda==1'b0) estados <= ERRO_MOEDA;
				
				if(T6_errMoeda==1'b1) estados <= ESPERA;
			end
			
			
		endcase 
	end
	
	always @ (estados) begin
		
		case(estados)
			
			ESPERA: begin

			sec10_bebida=1'b0; 
			sec10_moeda=1'b0;
			sec2_pressu=1'b0;
			sec10_aqueci=1'b0;
			sec2_entre=1'b0;
			sec6_errMoeda=1'b0;
			sec6_sensor=1'b0;
			rgb_red = 1'b0;
			rgb_green = 1'b0;
			rgb_blue = 1'b0;
			on_off = 1'b0;
			ATUAL = 3'b000;
			end
				
			ESCOLHA: begin
			sec10_bebida=1'b1; 
			sec10_moeda=1'b0;
			sec2_pressu=1'b0;
			sec10_aqueci=1'b0;
			sec2_entre=1'b0;
			sec6_errMoeda=1'b0;
			sec6_sensor=1'b0;
			rgb_red = 1'b0;
			rgb_green = 1'b0;
			rgb_blue = 1'b0;
			on_off = 1'b0;
			ATUAL = 3'b001;
			end
			
			VALOR: begin
			sec10_bebida=1'b0; 
			sec10_moeda=1'b1;
			sec2_pressu=1'b0;
			sec10_aqueci=1'b0;
			sec2_entre=1'b0;
			sec6_errMoeda=1'b0;
			sec6_sensor=1'b0;
			rgb_red = 1'b0;
			rgb_green = 1'b0;
			rgb_blue = 1'b0;
			on_off = 1'b1;
			ATUAL = 3'b010;
			end
			
			BOMBAGEM: begin
			sec10_bebida=1'b0; 
			sec10_moeda=1'b0;
			sec2_pressu=1'b1;
			sec10_aqueci=1'b0;
			sec2_entre=1'b0;
			sec6_errMoeda=1'b0;
			sec6_sensor=1'b0;
			rgb_blue = 1'b1;
			rgb_red = 1'b0;
			rgb_green =1'b0;
			on_off = 1'b0;
			ATUAL = 3'b011;
			end
			
			
			AQUECIMENTO: begin
			sec10_bebida=1'b0; 
			sec10_moeda=1'b0;
			sec2_pressu=1'b0;
			sec10_aqueci=1'b1;
			sec2_entre=1'b0;
			sec6_errMoeda=1'b0;
			sec6_sensor=1'b0;
			rgb_red = 1'b1;
			rgb_green = 1'b0;
			rgb_blue = 1'b0;
			on_off = 1'b0;
			ATUAL = 3'b100;
			end
			
			ENTREGA: begin
			sec10_bebida=1'b0; 
			sec10_moeda=1'b0;
			sec2_pressu=1'b0;
			sec10_aqueci=1'b0;
			sec2_entre=1'b1;
			sec6_errMoeda=1'b0;
			sec6_sensor=1'b0;
			rgb_green = 1'b1;
			rgb_red = 1'b0;
			rgb_blue = 1'b0;
			on_off = 1'b0;
			ATUAL = 3'b101;
			end
			
			ERRO_SENSOR: begin
			sec10_bebida=1'b0; 
			sec10_moeda=1'b0;
			sec2_pressu=1'b0;
			sec10_aqueci=1'b0;
			sec2_entre=1'b0;
			sec6_errMoeda=1'b0;
			sec6_sensor=1'b1;
			rgb_red = 1'b0;
			rgb_green = 1'b0;
			rgb_blue = 1'b0;
			on_off = 1'b0;
			ATUAL = 3'b110;
			end
			
			ERRO_MOEDA: begin
			sec10_bebida=1'b0; 
			sec10_moeda=1'b0;
			sec2_pressu=1'b0;
			sec10_aqueci=1'b0;
			sec2_entre=1'b0;
			sec6_errMoeda=1'b1;
			sec6_sensor=1'b0;
			rgb_red = 1'b0;
			rgb_green = 1'b0;
			rgb_blue = 1'b0;
			on_off = 1'b0;
			ATUAL = 3'b111;
			end
			default begin 
				sec10_bebida=1'b0; 
				sec10_moeda=1'b0;
				sec2_pressu=1'b0;
				sec10_aqueci=1'b0;
				sec2_entre=1'b0;
				sec6_errMoeda=1'b0;
				sec6_sensor=1'b0;
				rgb_red = 1'b0;
				rgb_green = 1'b0;
				rgb_blue = 1'b0;
				on_off = 1'b0;
				ATUAL = 3'b000;
			end
		endcase
	end
	
endmodule 