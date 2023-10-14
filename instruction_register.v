module instruction_register (
    input clk_i, reset_i, load_i,
    input [7:0] bus_i,
    output [7:0] ir_out 
);

reg [7:0] ir;

always @(posedge clk_i) begin
    if (reset_i) ir <= 8'b0;
    else if (load_i) ir <= bus_i;
end

assign ir_out = ir;

endmodule