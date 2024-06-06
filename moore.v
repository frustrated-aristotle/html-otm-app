module fsm_moore(
    input wire clk,
    input wire reset,
    input wire in,
    output reg out
);

    // Durum tanımları
    typedef enum reg [2:0] {
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100
    } state_t;

    state_t current_state, next_state;

    // Durum geçişleri
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Sonraki durum ve çıkış lojikleri
    always @(*) begin
        case (current_state)
            S0: begin
                if (in == 1'b1)
                    next_state = S1;
                else
                    next_state = S0;
                out = 1'b0;
            end
            S1: begin
                if (in == 1'b0)
                    next_state = S2;
                else
                    next_state = S1;
                out = 1'b0;
            end
            S2: begin
                if (in == 1'b0)
                    next_state = S3;
                else
                    next_state = S1;
                out = 1'b0;
            end
            S3: begin
                if (in == 1'b0)
                    next_state = S4;
                else
                    next_state = S1;
                out = 1'b0;
            end
            S4: begin
                if (in == 1'b1)
                    next_state = S1;
                else
                    next_state = S0;
                out = 1'b1;
            end
            default: begin
                next_state = S0;
                out = 1'b0;
            end
        endcase
    end

endmodule