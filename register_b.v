module register_b (
    input clk_i, reset_i, load_i,
    input [7:0] bus_i,
    output [7:0] b_o
);

reg [7:0] b;

always @(posedge clk_i) begin
    if (reset_i) b <= 8'b0;
    else if (load_i) b <= bus_i;
end

assign b_o = b;

endmodule
