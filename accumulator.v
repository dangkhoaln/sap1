module accumulator(
    input clk_i, reset_i, load_i,
    input [7:0] bus_i,
    output [7:0] accu_o
);

reg [7:0] accu;

always @(posedge clk_i) begin
    if (reset_i) accu <= 8'b0;
    else if (load_i) accu <= bus_i; 
end

assign accu_o = accu;

endmodule