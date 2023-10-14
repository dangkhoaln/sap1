module program_counter (
    input clk_i, reset_i, inc_i,
    output[3:0] pc_out
);

reg[3:0] count;

always @(posedge clk_i) begin
    if (reset_i) count <= 4'b0;
    else if (inc_i) count <= count + 1;
end

assign pc_out = count;

endmodule