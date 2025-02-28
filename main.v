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
    integer bcm_delay = 1;
    integer bcm_counter = 0;
    integer is_waiting = 0;

    always @(posedge CLK) begin
        // TODO: colour depth -- Simplest way is LUT with PWM?
        if (ctrl_clk == 0) begin
            if (_x == 0) ctrl_lat = 0; // Close latch to load in next data

            // Load colours
            col_buff[0] = colour[bit];                          // R1
            col_buff[1] = colour[bit];                          // R2
            col_buff[2] = colour[bit + bit_depth];              // G1
            col_buff[3] = colour[bit + bit_depth];              // G2
            col_buff[4] = colour[bit + bit_depth + bit_depth];  // B1
            col_buff[5] = colour[bit + bit_depth + bit_depth];  // B2
            
            ctrl_clk = 1;
            _x = _x + 1;

            if (_x >= width) begin
                _x = 0;
                ctrl_lat = 1; // Open latch to commit colours
                bit = bit + 1;

                is_waiting = 1;
            end

            if (bit >= bit_depth) begin
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
    assign test_led = ctrl_clk;
endmodule