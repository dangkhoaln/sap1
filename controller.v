module controller (
    input clk_i, reset_i,
    input [3:0] opcode_i,
    output pc_en_o,
    output pc_inc_o,
    output mem_load_o,
    output mem_en_o,
    output ins_load_o,
    output ins_en_o,
    output a_load_o,
    output a_en_o,
    output adder_sub_o,
    output adder_en_o,
    output b_load_o,
    output output_load_o
);

localparam S1 = 3'd0, S2 = 3'd1, S3 = 3'd2, S4 = 3'd3, S5 = 3'd4, S6 = 3'd5;
reg [3:0] stage;

reg pc_en;
reg pc_inc;
reg mem_load;
reg mem_en;
reg ins_load;
reg ins_en;
reg a_load;
reg a_en;
reg adder_sub;
reg adder_en;
reg b_load;
reg output_load;

always @(*) begin
    pc_en = 1'b0;
    pc_inc = 1'b0;
    mem_load = 1'b0;
    mem_en = 1'b0;
    ins_load = 1'b0;
    ins_en = 1'b0;
    a_load = 1'b0;
    a_en = 1'b0;
    adder_sub = 1'b0;
    adder_en = 1'b0;
    b_load = 1'b0;
    output_load = 1'b0;

    case (stage)
    S1: begin
        pc_en = 1'b1;
        mem_load = 1'b1;
    end
    S2: begin
        pc_inc = 1'b1;
    end
    S3: begin
        mem_en = 1'b1;
        ins_load = 1'b1;
    end
    S4: begin
        case (opcode_i)
            4'b0000: begin // LDA
                ins_en = 1'b1;
                mem_load = 1'b1;
            end
            4'b0001: begin // ADD
                ins_en = 1'b1;
                mem_load = 1'b1;
            end
            4'b0010: begin // SUB
                ins_en = 1'b1;
                mem_load = 1'b1;
            end
            4'b1110: begin // OUT
                a_en = 1'b1;
                output_load = 1'b1;
            end
        endcase
    end
    S5: begin
        case (opcode_i)
            4'b0000: begin // LDA
                mem_en = 1'b1;
                a_load = 1'b1;            
            end
            4'b0001: begin // ADD
                mem_en = 1'b1;
                b_load = 1'b1;
            end
            4'b0010: begin // SUB
                mem_en = 1'b1;
                b_load = 1'b1;
            end
        endcase
    end
    S6: begin
        case (opcode_i)
            4'b0001: begin // ADD
                adder_en = 1'b1;
                a_load = 1'b1;
            end
            4'b0010: begin // SUB
                adder_en = 1'b1;
                adder_sub = 1'b1;
                a_load = 1'b1;
            end
        endcase
    end
    endcase
end

always @(negedge clk_i, reset_i) begin
    if (reset_i) begin
        stage <= S1;
    end
    else if (stage == S6) begin
        stage <= S1;
    end
    else begin
        stage <= stage + 4'd1;
    end
end

assign pc_en_o = pc_en;
assign pc_inc_o = pc_inc;
assign mem_load_o = mem_load;
assign mem_en_o = mem_en;
assign ins_load_o = ins_load;
assign ins_en_o = ins_en;
assign a_load_o = a_load;
assign a_en_o = a_en;
assign adder_sub_o = adder_sub;
assign adder_en_o = adder_en;
assign b_load_o = b_load;
assign output_load_o = output_load;

endmodule
