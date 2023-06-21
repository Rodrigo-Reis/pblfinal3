module contadora (
    input clk,
    output reg [2:0] output_cont
);
    always @(posedge clk)begin
        if (output_cont == 3'b111) begin
            output_cont = 	0;
        end
        output_cont = output_cont + 1;
    end
endmodule 