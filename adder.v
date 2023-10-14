module adder (
    input [7:0] a_i, b_i,
    input sub_i, 
    output [7:0] adder_o
);

assign adder_o = (~sub_i) ? a_i + b_i : a_i - b_i;

endmodule