module (
    input clk, reset, load;
    input [7:0] in;
    output [7:0] out;
);

reg [7:0] output_register;

always @(posedge clk) begin
    if (reset) output_register <= 8'b0;
    else if (load) output_register <= in;
end

assign out = output_register;

endmodule