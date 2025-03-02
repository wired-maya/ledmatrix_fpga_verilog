// TODO: Gamma correction module
// TODO: Implement HDMI

module main (
    // TinyFPGA on-board pins
    input CLK,     // 16MHz clock
    output USBPU,  // USB pull-up resistor

    // Output pins needed to control matrix
    output PIN_1,  // Blank
    output PIN_2,  // Clock
    output PIN_3,  // Latch
    output PIN_4,  // Address A
    output PIN_5,  // Address B
    output PIN_6,  // Address C
    output PIN_7,  // Address D
    output PIN_8,  // Address E
    output PIN_14, // R1
    output PIN_15, // R2
    output PIN_16, // G1
    output PIN_17, // G2
    output PIN_18, // B1
    output PIN_19, // B2

    // Input pins for HDMI
    input PIN_24,  // TMDS Data 2+
    input PIN_23,  // TMDS Data 2-
    input PIN_22,  // TMDS Data 1+
    input PIN_21,  // TMDS Data 1-
    input PIN_13,  // TMDS Data 0+
    input PIN_12,  // TMDS Data 0-
    input PIN_11,  // TMDS Clock+
    input PIN_10,  // TMDS Clock-
);
    // Drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

    // Single signal wires
    wire tmds_data_2;
    wire tmds_data_1;
    wire tmds_data_0;
    wire tmds_clk;

    // Convert differential signal to single signal wire
    diff_sig_in diff_sig_data_2(PIN_24, PIN_23, tmds_data_2);
    diff_sig_in diff_sig_data_1(PIN_22, PIN_21, tmds_data_1);
    diff_sig_in diff_sig_data_0(PIN_13, PIN_12, tmds_data_0);
    diff_sig_in diff_sig_clk(PIN_11, PIN_10, tmds_clk);

    // Instantiate LED matrix and start displaying
    led_matrix led_matrix_inst(CLK, PIN_1, PIN_2, PIN_3, PIN_4, PIN_5, PIN_6, PIN_7, PIN_8, PIN_14, PIN_15, PIN_16, PIN_17, PIN_18, PIN_19);
endmodule