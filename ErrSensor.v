module ErrSensor (chaves, ERR1);

	input [2:0] chaves;
	output ERR1;
	wire f1,f2,f3;
	//ERR1 = 1; erro de sensor
	//ERR1 = 0; não é erro de sensor
	assign f1 = chaves[0];
	assign f3 = chaves[1];
	assign f2 = chaves[2];
	assign ERR1 = f1 || f2 || f3;
	
endmodule
	