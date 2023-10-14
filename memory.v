module memory(
    input clk_i, reset_i, load_i,
    input[7:0] bus_i,
    output[7:0] mem_o
);

initial begin
    $readmemh("sample_memory.mem",ram);
end

reg[3:0] mar; // Memory address register
reg[7:0] ram[0:15];

always @(posedge clk_i) begin
    if (reset_i) mar <= 4'b0;
    else if (load_i) mar <= bus_i[3:0];
end

assign mem_o = ram[mar];
 
endmodule;