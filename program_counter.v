module program_counter (
    input clk, reset, increment;
    output out;
)

reg [3:0] count;

always @(posedge clk) begin
    if (reset) count <= 4'b0;
    else if (increment) count <= count + 1;
end

endmodule