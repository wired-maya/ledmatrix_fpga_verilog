// TODO: `define pins here to reduce assign statements

// look in pins.pcf for all the pin names on the TinyFPGA BX board
module main (
    input CLK,    // 16MHz clock
    output LED,   // User/boot LED next to power LED
    output USBPU,  // USB pull-up resistor

    // Output pins needed to control matrix
    output PIN_1,
    output PIN_2,
    output PIN_3,
    output PIN_4,
    output PIN_5,
    output PIN_6,
    output PIN_7,
    output PIN_8,
    output PIN_14,
    output PIN_15,
    output PIN_16,
    output PIN_17,
    output PIN_18,
    output PIN_19,

    // Input pins for HDMI
    input PIN_24,
    input PIN_23,
    input PIN_22,
    input PIN_21,
    input PIN_13,
    input PIN_12,
    input PIN_11,
    input PIN_10,
);
    // Consts for display
    parameter bit_depth = 8;
    parameter width = 64;
    parameter halfwidth = 32;
    parameter height = 64;
    
    // Test colour
    // Reversed because bit indexing is backwards in Verilog
    // parameter [0:23] colour = 24'h362312; // Dark brown
    parameter [0:23] colour = 24'h080301; // Gamma corrected dark brown
    // parameter [0:23] colour = 24'hFF0000;

    // Drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

    // Wires for each pin needed by matrix
    wire ctrl_oe;
    reg ctrl_clk = 0;
    reg ctrl_lat = 0; // Closed initially
    wire addr_a, addr_b, addr_c, addr_d, addr_e;
    wire col_r1, col_r2, col_g1, col_g2, col_b1, col_b2;

    // TMDS wires for HDMI
    wire tmds_data_2_pos, tmds_data_2_neg;
    wire tmds_data_1_pos, tmds_data_1_neg;
    wire tmds_data_0_pos, tmds_data_0_neg;
    wire tmds_clk_pos, tmds_clk_neg;

    // Assign control pins, on the left side of the board
    assign PIN_1 = ctrl_oe; // "Output enabled" or blank pin
    assign PIN_2 = ctrl_clk; // Panel clock, not FPGA clock
    assign PIN_3 = ctrl_lat; // Latch

    // Assign address pins, on the left side of the board
    assign PIN_4 = addr_a;
    assign PIN_5 = addr_b;
    assign PIN_6 = addr_c;
    assign PIN_7 = addr_d;
    assign PIN_8 = addr_e;

    // Assign colour pins, on the right side of the board
    assign PIN_14 = col_r1;
    assign PIN_15 = col_r2;
    assign PIN_16 = col_g1;
    assign PIN_17 = col_g2;
    assign PIN_18 = col_b1;
    assign PIN_19 = col_b2;

    // Assign HDMI specific pins
    assign PIN_24 = tmds_data_2_pos;
    assign PIN_23 = tmds_data_2_neg;
    assign PIN_22 = tmds_data_1_pos;
    assign PIN_21 = tmds_data_1_neg;
    assign PIN_13 = tmds_data_0_pos;
    assign PIN_12 = tmds_data_0_neg;
    assign PIN_11 = tmds_clk_pos;
    assign PIN_10 = tmds_clk_neg;

    // Single wires
    wire tmds_data_2;
    wire tmds_data_1;
    wire tmds_data_0;
    wire tmds_clk;

    // Convert differential signal to single wire
    diff_sig_in diff_sig_data_2(tmds_data_2_pos, tmds_data_2_neg, tmds_data_2);
    diff_sig_in diff_sig_data_1(tmds_data_1_pos, tmds_data_1_neg, tmds_data_1);
    diff_sig_in diff_sig_data_0(tmds_data_0_pos, tmds_data_0_neg, tmds_data_0);
    diff_sig_in diff_sig_clk(tmds_clk_pos, tmds_clk_neg, tmds_clk);

    // Brightness control using PWM and the blank pin
    assign ctrl_oe = pwm_pattern[pwm_counter]; // Set OE pin to PWM
    reg [63:0] pwm_pattern = 64'hFFFFFFFFFFFFFFFE; // Adjust to change brightness, higher number of 1 bits means lower brightness (remember, *blank* pin)
    reg [5:0] pwm_counter = 0; // For indexing pwm_pattern

    // Set address to the relative pins
    // wire [4:0] address;
    reg [4:0] _address = 0; // Needs to be reg for assignments from block
    // assign address = _address;
    assign addr_a = _address[0];
    assign addr_b = _address[1];
    assign addr_c = _address[2];
    assign addr_d = _address[3];
    assign addr_e = _address[4];

    // Set colour buffer to the relative pins
    reg [5:0] col_buff = 0;
    assign col_r1 = col_buff[0];
    assign col_r2 = col_buff[1];
    assign col_g1 = col_buff[2];
    assign col_g2 = col_buff[3];
    assign col_b1 = col_buff[4];
    assign col_b2 = col_buff[5];

    // Display loop that for now shows test colour
    integer _x = 0; // x is already used in verilog
    integer y = 0;
    integer bit = 0;

    wire [255:0] R_pwm_pattern;
    wire [255:0] G_pwm_pattern;
    wire [255:0] B_pwm_pattern;

    pwm_lut R_pwm_lut(colour[0:7], R_pwm_pattern);
    pwm_lut G_pwm_lut(colour[8:15], G_pwm_pattern);
    pwm_lut B_pwm_lut(colour[16:23], B_pwm_pattern);

    always @(posedge CLK) begin
        // TODO: colour depth -- Simplest way is LUT with PWM?
        if (ctrl_clk == 0) begin
            if (_x == 0) ctrl_lat = 0; // Close latch to load in next data

            // Load colours
            col_buff[0] = R_pwm_pattern[bit]; // R1
            col_buff[1] = R_pwm_pattern[bit]; // R2
            col_buff[2] = G_pwm_pattern[bit]; // G1
            col_buff[3] = G_pwm_pattern[bit]; // G2
            col_buff[4] = B_pwm_pattern[bit]; // B1
            col_buff[5] = B_pwm_pattern[bit]; // B2
            
            ctrl_clk = 1;
            _x = _x + 1;

            if (_x >= width) begin
                _x = 0;
                ctrl_lat = 1; // Open latch to commit colours
                bit = bit + 1;
            end

            if (bit >= 256) begin
                bit = 0;
                _address = _address + 1;
            end
            
            if (_address >= halfwidth) _address = 0;
        end else ctrl_clk <= 0;
    end

    // PWM at clock frequency
    always @(posedge CLK) begin
        pwm_counter <= pwm_counter + 1;
    end

    // Test LED
    wire test_led;
    assign LED = test_led;
    assign test_led = tmds_clk_pos;
endmodule