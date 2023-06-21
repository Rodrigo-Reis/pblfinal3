module divisor_clock(clock_in,clock_out700hz,clock_out1hz);

input clock_in; 
output clock_out700hz, clock_out1hz; 

reg[15:0] counter=16'd0;
reg[24:0] counter2=25'd0;

initial begin 
	counter = 0;
	counter2 = 0;
end

assign clock_out700hz = counter[15];
assign clock_out1hz = counter2[24];

always @(posedge clock_in) begin
	counter <= counter + 1'b1;
	if (counter == 16'b1111111111111111) begin
		counter <= 0;
	end
end

always @(posedge clock_in) begin
	counter2 <= counter2 + 1'b1;
	if (counter2 == 25'b1111111111111111111111111) begin
		counter2 <= 0;
	end
end 

endmodule 