module adder (
    input [7:0] a_word, b_word,
    input sum, // 1 for Add, 0 for Sub
    output [7:0] out
);

assign out = (sum) ? a_word + b_word : a_word - b_word;

endmodule