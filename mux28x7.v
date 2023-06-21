module mux28x7 (
    input [27:0] data,
    input [1:0] select,
    output reg [6:0] saida
);
    always @(select,data) begin
        case (select)
            2'b00: saida <= data[6:0];
            2'b01: saida <= data[13:7];
            2'b10: saida <= data[20:14];
            2'b11: saida <= data[27:21];
				default saida <= 28'b000000000000000000000000000;
        endcase
    end
endmodule 