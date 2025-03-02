module led_matrix(
    // TinyFPGA on-board pins
    input in_clk,    // 16MHz clock

    // Output pins needed to control matrix
    output ctrl_blk, // Blank
    output ctrl_clk, // Clock
    output ctrl_lat, // Latch
    output addr_a,   // Address A
    output addr_b,   // Address B
    output addr_c,   // Address C
    output addr_d,   // Address D
    output addr_e,   // Address E
    output col_r1,   // R1
    output col_r2,   // R2
    output col_g1,   // G1
    output col_g2,   // G2
    output col_b1,   // B1
    output col_b2,   // B2
);
    // Consts for display
    parameter bit_depth = 8;
    parameter width = 64;
    parameter height = 64;
    parameter [23:0] colour = 24'h080301; // Test colour, gamma corrected dark brown

    // Assign control pins to changing registers
    reg ctrl_clk_reg = 0;
    reg ctrl_lat_reg = 0; // Closed initially
    assign ctrl_clk = ctrl_clk_reg;
    assign ctrl_lat = ctrl_lat_reg;

    // Brightness control using PWM and the blank pin
    reg [63:0] pwm_pattern = 64'hFFFFFFFFFFFFFFFE; // Adjust to change brightness, higher number of 1 bits means lower brightness (remember, *blank* pin)
    reg [5:0] pwm_counter = 0; // For indexing pwm_pattern
    assign ctrl_blk = pwm_pattern[pwm_counter]; // Set blank pin to PWM

    always @(posedge in_clk) pwm_counter <= pwm_counter + 1;

    // Set address to the relative pins
    reg [4:0] address = 0; // Needs to be reg for assignments from block
    assign addr_a = address[0];
    assign addr_b = address[1];
    assign addr_c = address[2];
    assign addr_d = address[3];
    assign addr_e = address[4];

    // Set colour buffer to the relative pins
    reg [5:0] col_buff = 0;
    assign col_r1 = col_buff[0];
    assign col_r2 = col_buff[1];
    assign col_g1 = col_buff[2];
    assign col_g2 = col_buff[3];
    assign col_b1 = col_buff[4];
    assign col_b2 = col_buff[5];

    // Convert colour to dimming patterns
    wire [255:0] R_pwm_pattern;
    wire [255:0] G_pwm_pattern;
    wire [255:0] B_pwm_pattern;

    pwm_lut R_pwm_lut(colour[23:16], R_pwm_pattern);
    pwm_lut G_pwm_lut(colour[15:8], G_pwm_pattern);
    pwm_lut B_pwm_lut(colour[7:0], B_pwm_pattern);

    // Display loop that for now shows test colour
    integer _x = 0; // x is already used in verilog
    integer y = 0;
    integer bit = 0;

    always @(posedge in_clk) begin
        if (ctrl_clk_reg == 0) begin
            if (_x == 0) ctrl_lat_reg = 0; // Close latch to load in next data

            // Load colours
            col_buff[0] = R_pwm_pattern[bit]; // R1
            col_buff[1] = R_pwm_pattern[bit]; // R2
            col_buff[2] = G_pwm_pattern[bit]; // G1
            col_buff[3] = G_pwm_pattern[bit]; // G2
            col_buff[4] = B_pwm_pattern[bit]; // B1
            col_buff[5] = B_pwm_pattern[bit]; // B2
            
            ctrl_clk_reg = 1;
            _x = _x + 1;

            if (_x >= width) begin
                _x = 0;
                ctrl_lat_reg = 1; // Open latch to commit colours
                bit = bit + 1;
            end

            if (bit >= 256) begin
                bit = 0;
                address = address + 1;
            end
            
            if (address >= height / 2) address = 0;
        end else ctrl_clk_reg <= 0;
    end
endmodule