module level_to_pulse(level,pulse,clock);

	input level,clock;
	output pulse;

	wire f1,f2,f3;
	
	and(f2, f1, level);
	and(pulse, f1,!f3);
	
	FFD (level, 1 ,clock, f1 );  
	FFD (f2, 1, clock, f3 );
	


endmodule
	
