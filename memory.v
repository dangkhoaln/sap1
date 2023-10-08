module memory(
    input clk,reset,load;
    input[7:0] bus;
    output[7:0] out
);

initial begin
    $readmemh("program.bin",ram);
end

reg[3:0] mar; // Memory address register
reg[7:0] ram[0:15];

always @(posedge clk) begin
    if (reset) mar <= 4'b0;
    else if (load) mar <= bus[3:0];
end

assign out = ram[mar];
 
endmodule;