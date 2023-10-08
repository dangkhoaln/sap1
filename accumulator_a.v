module accumulator_a (
    input clk, reset, load;
    input [7:0] in;
    output [7:0] out;
);

reg accumulator_a;

always @(posedge clk) begin
    if (reset) accumulator_a <= 8'b0;
    else if (load) accumulator_a <= in; 
end

assign out = accumulator_a;