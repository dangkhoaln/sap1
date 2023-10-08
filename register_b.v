module register_b (
    input clk, reset, load;
    input [7:0] in;
    output [7:0] out;
);

reg [7:0] register_b;

always @(posedge clk) begin
    if (reset) register_b <= 8'b0;
    else if (load) register_b <= in;
end

assign out = register_b;

endmodule
