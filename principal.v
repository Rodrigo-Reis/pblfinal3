module principal (chmoeda, chbebida, chsensor,
btn1, btn2, clock, 
segmentos, digito, ponto,
rgb_green, rgb_blue,rgb_red);


input [1:0] chmoeda, chbebida;
input [2:0] chsensor;
input clock, btn1, btn2;

output ponto;
output [6:0] segmentos;
output [3:0] digito;
output rgb_green, rgb_blue, rgb_red;
	
tempo2seg entrega    		(clock1hz, sec2_entre, T2_entre);
tempo2seg pressu     		(clock1hz, sec2_pressu, T2_pressu);
tempo6seg errosensor 		(clock1hz, sec6_sensor, T6_sensor);
tempo6seg erromoeda  		(clock1hz, sec6_errMoeda, T6_errMoeda);
tempo10seg bebiba  	 		(clock1hz, sec10_bebida, T10_bebida);
tempo10seg 	  moeda  	 	(clock1hz, sec10_moeda, T10_moeda);
tempo10seg aquecimento  	 (clock1hz, sec10_aqueci, T10_aqueci);
 
wire moedaINV, moedaNCORRESPONDE,ErroMoeda,Pinserir, Penter,ErroSensor, cedulaINV, valorultrapassou;

wire 	T10_bebida, T10_moeda, T2_pressu, T10_aqueci, T2_entre, T6_errMoeda, T6_sensor, on_off;
wire sec10_bebida, sec10_moeda, sec2_pressu, sec10_aqueci, sec2_entre, sec6_errMoeda,sec6_sensor;
wire clock1hz,clock700hz; 
wire [4:0] soma;
wire [2:0] estados;


assign ErroMoeda = moedaINV || moedaNCORRESPONDE ;
assign ponto = 1'b1;

MaquinadeEstados (Penter,
	ErroSensor, ErroMoeda, 
	T10_bebida, T10_moeda, 
	T2_pressu, T10_aqueci, T2_entre, T6_errMoeda,
	T6_sensor, clock700hz, estados,
	sec10_bebida, sec10_moeda, 
	sec2_pressu, sec10_aqueci, sec2_entre, sec6_errMoeda,
	sec6_sensor, rgb_green, rgb_blue, rgb_red, on_off);

level_to_pulse enter (!btn1, Penter,clock700hz);
level_to_pulse inserir (!btn2,Pinserir,clock700hz);

ErrSensor (chsensor, ErroSensor);

SomadorMoeda (chmoeda, Pinserir, soma, clock700hz, cedulaINV, valorultrapassou, on_off);

ErrMoeda (chbebida, moedaINV, moedaNCORRESPONDE, soma, clock700hz);

mostrardisplay (clock700hz,estados,chsensor,soma,chbebida,cedulaINV, valorultrapassou, segmentos,digito);
 
divisor_clock (clock,clock700hz,clock1hz);

endmodule