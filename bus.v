module bus (
    input [3:0] pc_i,
    input pc_en_i,
    input [7:0] ram_i,
    input ram_en_i,
    input [3:0] ir_i,
    input ir_en_i,
    input [7:0] accu_i,
    input accu_en_i,
    input [7:0] adder_i,
    input adder_en_i,
    output [7:0] bus_o
);

reg [7:0] bus;

always @(*) begin
    if (pc_en_i) bus = pc_i;
    else if (ram_en_i) bus = ram_i;
    else if (ir_en_i) bus = ir_i;
    else if (accu_en_i) bus = accu_i;
    else if (adder_en_i) bus = adder_i;
    else bus = 8'b0; 
end

assign bus_o = bus;

endmodule