module instruction_register (
    input clk, reset, load, enable;
    input [7:0] in;
    output [7:0] out;
);

reg [7:0] instruction;

always @(posedge clk) begin
    if (reset) instruction <= 8'b0;
    else if (load) instruction <= in;
end

assign out = instruction;

endmodule