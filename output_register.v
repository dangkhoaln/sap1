module output_register (
    input clk_i, reset_i, load_i,
    input [7:0] bus_i,
    output [7:0] or_o
);

reg [7:0] regout;

always @(posedge clk_i) begin
    if (reset_i) regout <= 8'b0;
    else if (load_i) regout <= bus_i;
end

assign or_o = regout;

endmodule