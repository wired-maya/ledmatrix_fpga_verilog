// Convert from a differential signal to a single signal
module diff_sig_in(input in_pos, input in_neg, output out);
    reg out_reg;
    assign out = out_reg;

    // Do not change when both differential signals are equal
    always @(in_pos, in_neg) begin
        if (in_pos == 1 && in_neg == 0) out_reg <= 1;
        else if (in_pos == 0 && in_neg == 1) out_reg <= 0;
    end
endmodule