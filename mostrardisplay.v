module mostrardisplay ( input clk,
    input [2:0]select,
	 input [2:0]sensores,
	 input [4:0] soma,
	 input [1:0] bebida,
	 input cedulaINV, 
	 input valoramais,
    output [6:0] segment,
    output [3:0] digit
	 
);
    wire [2:0] cont;
    wire [27:0] cadeia;

   

   contadora (clk, cont);

   decodificador28bits(select, cadeia, bebida, soma, sensores, cedulaINV, valoramais);

   mux28x7(cadeia, cont, segment);

   DEMUX4X1(1, cont, digit);

endmodule 