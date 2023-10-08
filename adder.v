module adder (
    input clk, reset,
    input [7:0] a_word, b_word,
    input sum, // 1 for Add, 0 for Sub
    output [7:0] out
);

reg [7:0] adder;

always @(posedge clk) begin
    if (reset) adder <= 8'b0;
    else if (sum) adder <= a_word + b_word;
    else adder <= a_word - b_word;
end

assign out = adder;

endmodule