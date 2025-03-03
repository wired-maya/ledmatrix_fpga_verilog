module gamma_lut(input [7:0] in, output [7:0] out);
    reg [7:0] out_reg;
    assign out = out_reg;

    always @(in) begin
        case (in)
            8'h00: out_reg <= 8'h00;
            8'h01: out_reg <= 8'h00;
            8'h02: out_reg <= 8'h00;
            8'h03: out_reg <= 8'h00;
            8'h04: out_reg <= 8'h00;
            8'h05: out_reg <= 8'h00;
            8'h06: out_reg <= 8'h00;
            8'h07: out_reg <= 8'h00;
            8'h08: out_reg <= 8'h00;
            8'h09: out_reg <= 8'h00;
            8'h0a: out_reg <= 8'h00;
            8'h0b: out_reg <= 8'h00;
            8'h0c: out_reg <= 8'h00;
            8'h0d: out_reg <= 8'h00;
            8'h0e: out_reg <= 8'h00;
            8'h0f: out_reg <= 8'h01;
            8'h10: out_reg <= 8'h01;
            8'h11: out_reg <= 8'h01;
            8'h12: out_reg <= 8'h01;
            8'h13: out_reg <= 8'h01;
            8'h14: out_reg <= 8'h01;
            8'h15: out_reg <= 8'h01;
            8'h16: out_reg <= 8'h01;
            8'h17: out_reg <= 8'h01;
            8'h18: out_reg <= 8'h01;
            8'h19: out_reg <= 8'h02;
            8'h1a: out_reg <= 8'h02;
            8'h1b: out_reg <= 8'h02;
            8'h1c: out_reg <= 8'h02;
            8'h1d: out_reg <= 8'h02;
            8'h1e: out_reg <= 8'h02;
            8'h1f: out_reg <= 8'h02;
            8'h20: out_reg <= 8'h03;
            8'h21: out_reg <= 8'h03;
            8'h22: out_reg <= 8'h03;
            8'h23: out_reg <= 8'h03;
            8'h24: out_reg <= 8'h03;
            8'h25: out_reg <= 8'h04;
            8'h26: out_reg <= 8'h04;
            8'h27: out_reg <= 8'h04;
            8'h28: out_reg <= 8'h04;
            8'h29: out_reg <= 8'h05;
            8'h2a: out_reg <= 8'h05;
            8'h2b: out_reg <= 8'h05;
            8'h2c: out_reg <= 8'h05;
            8'h2d: out_reg <= 8'h06;
            8'h2e: out_reg <= 8'h06;
            8'h2f: out_reg <= 8'h06;
            8'h30: out_reg <= 8'h06;
            8'h31: out_reg <= 8'h07;
            8'h32: out_reg <= 8'h07;
            8'h33: out_reg <= 8'h07;
            8'h34: out_reg <= 8'h08;
            8'h35: out_reg <= 8'h08;
            8'h36: out_reg <= 8'h08;
            8'h37: out_reg <= 8'h09;
            8'h38: out_reg <= 8'h09;
            8'h39: out_reg <= 8'h09;
            8'h3a: out_reg <= 8'h0a;
            8'h3b: out_reg <= 8'h0a;
            8'h3c: out_reg <= 8'h0b;
            8'h3d: out_reg <= 8'h0b;
            8'h3e: out_reg <= 8'h0b;
            8'h3f: out_reg <= 8'h0c;
            8'h40: out_reg <= 8'h0c;
            8'h41: out_reg <= 8'h0d;
            8'h42: out_reg <= 8'h0d;
            8'h43: out_reg <= 8'h0d;
            8'h44: out_reg <= 8'h0e;
            8'h45: out_reg <= 8'h0e;
            8'h46: out_reg <= 8'h0f;
            8'h47: out_reg <= 8'h0f;
            8'h48: out_reg <= 8'h10;
            8'h49: out_reg <= 8'h10;
            8'h4a: out_reg <= 8'h11;
            8'h4b: out_reg <= 8'h11;
            8'h4c: out_reg <= 8'h12;
            8'h4d: out_reg <= 8'h12;
            8'h4e: out_reg <= 8'h13;
            8'h4f: out_reg <= 8'h13;
            8'h50: out_reg <= 8'h14;
            8'h51: out_reg <= 8'h14;
            8'h52: out_reg <= 8'h15;
            8'h53: out_reg <= 8'h16;
            8'h54: out_reg <= 8'h16;
            8'h55: out_reg <= 8'h17;
            8'h56: out_reg <= 8'h17;
            8'h57: out_reg <= 8'h18;
            8'h58: out_reg <= 8'h19;
            8'h59: out_reg <= 8'h19;
            8'h5a: out_reg <= 8'h1a;
            8'h5b: out_reg <= 8'h1a;
            8'h5c: out_reg <= 8'h1b;
            8'h5d: out_reg <= 8'h1c;
            8'h5e: out_reg <= 8'h1c;
            8'h5f: out_reg <= 8'h1d;
            8'h60: out_reg <= 8'h1e;
            8'h61: out_reg <= 8'h1e;
            8'h62: out_reg <= 8'h1f;
            8'h63: out_reg <= 8'h20;
            8'h64: out_reg <= 8'h21;
            8'h65: out_reg <= 8'h21;
            8'h66: out_reg <= 8'h22;
            8'h67: out_reg <= 8'h23;
            8'h68: out_reg <= 8'h23;
            8'h69: out_reg <= 8'h24;
            8'h6a: out_reg <= 8'h25;
            8'h6b: out_reg <= 8'h26;
            8'h6c: out_reg <= 8'h27;
            8'h6d: out_reg <= 8'h27;
            8'h6e: out_reg <= 8'h28;
            8'h6f: out_reg <= 8'h29;
            8'h70: out_reg <= 8'h2a;
            8'h71: out_reg <= 8'h2b;
            8'h72: out_reg <= 8'h2b;
            8'h73: out_reg <= 8'h2c;
            8'h74: out_reg <= 8'h2d;
            8'h75: out_reg <= 8'h2e;
            8'h76: out_reg <= 8'h2f;
            8'h77: out_reg <= 8'h30;
            8'h78: out_reg <= 8'h31;
            8'h79: out_reg <= 8'h31;
            8'h7a: out_reg <= 8'h32;
            8'h7b: out_reg <= 8'h33;
            8'h7c: out_reg <= 8'h34;
            8'h7d: out_reg <= 8'h35;
            8'h7e: out_reg <= 8'h36;
            8'h7f: out_reg <= 8'h37;
            8'h80: out_reg <= 8'h38;
            8'h81: out_reg <= 8'h39;
            8'h82: out_reg <= 8'h3a;
            8'h83: out_reg <= 8'h3b;
            8'h84: out_reg <= 8'h3c;
            8'h85: out_reg <= 8'h3d;
            8'h86: out_reg <= 8'h3e;
            8'h87: out_reg <= 8'h3f;
            8'h88: out_reg <= 8'h40;
            8'h89: out_reg <= 8'h41;
            8'h8a: out_reg <= 8'h42;
            8'h8b: out_reg <= 8'h43;
            8'h8c: out_reg <= 8'h44;
            8'h8d: out_reg <= 8'h45;
            8'h8e: out_reg <= 8'h46;
            8'h8f: out_reg <= 8'h47;
            8'h90: out_reg <= 8'h49;
            8'h91: out_reg <= 8'h4a;
            8'h92: out_reg <= 8'h4b;
            8'h93: out_reg <= 8'h4c;
            8'h94: out_reg <= 8'h4d;
            8'h95: out_reg <= 8'h4e;
            8'h96: out_reg <= 8'h4f;
            8'h97: out_reg <= 8'h51;
            8'h98: out_reg <= 8'h52;
            8'h99: out_reg <= 8'h53;
            8'h9a: out_reg <= 8'h54;
            8'h9b: out_reg <= 8'h55;
            8'h9c: out_reg <= 8'h57;
            8'h9d: out_reg <= 8'h58;
            8'h9e: out_reg <= 8'h59;
            8'h9f: out_reg <= 8'h5a;
            8'ha0: out_reg <= 8'h5b;
            8'ha1: out_reg <= 8'h5d;
            8'ha2: out_reg <= 8'h5e;
            8'ha3: out_reg <= 8'h5f;
            8'ha4: out_reg <= 8'h61;
            8'ha5: out_reg <= 8'h62;
            8'ha6: out_reg <= 8'h63;
            8'ha7: out_reg <= 8'h64;
            8'ha8: out_reg <= 8'h66;
            8'ha9: out_reg <= 8'h67;
            8'haa: out_reg <= 8'h69;
            8'hab: out_reg <= 8'h6a;
            8'hac: out_reg <= 8'h6b;
            8'had: out_reg <= 8'h6d;
            8'hae: out_reg <= 8'h6e;
            8'haf: out_reg <= 8'h6f;
            8'hb0: out_reg <= 8'h71;
            8'hb1: out_reg <= 8'h72;
            8'hb2: out_reg <= 8'h74;
            8'hb3: out_reg <= 8'h75;
            8'hb4: out_reg <= 8'h77;
            8'hb5: out_reg <= 8'h78;
            8'hb6: out_reg <= 8'h79;
            8'hb7: out_reg <= 8'h7b;
            8'hb8: out_reg <= 8'h7c;
            8'hb9: out_reg <= 8'h7e;
            8'hba: out_reg <= 8'h7f;
            8'hbb: out_reg <= 8'h81;
            8'hbc: out_reg <= 8'h82;
            8'hbd: out_reg <= 8'h84;
            8'hbe: out_reg <= 8'h85;
            8'hbf: out_reg <= 8'h87;
            8'hc0: out_reg <= 8'h89;
            8'hc1: out_reg <= 8'h8a;
            8'hc2: out_reg <= 8'h8c;
            8'hc3: out_reg <= 8'h8d;
            8'hc4: out_reg <= 8'h8f;
            8'hc5: out_reg <= 8'h91;
            8'hc6: out_reg <= 8'h92;
            8'hc7: out_reg <= 8'h94;
            8'hc8: out_reg <= 8'h95;
            8'hc9: out_reg <= 8'h97;
            8'hca: out_reg <= 8'h99;
            8'hcb: out_reg <= 8'h9a;
            8'hcc: out_reg <= 8'h9c;
            8'hcd: out_reg <= 8'h9e;
            8'hce: out_reg <= 8'h9f;
            8'hcf: out_reg <= 8'ha1;
            8'hd0: out_reg <= 8'ha3;
            8'hd1: out_reg <= 8'ha5;
            8'hd2: out_reg <= 8'ha6;
            8'hd3: out_reg <= 8'ha8;
            8'hd4: out_reg <= 8'haa;
            8'hd5: out_reg <= 8'hac;
            8'hd6: out_reg <= 8'had;
            8'hd7: out_reg <= 8'haf;
            8'hd8: out_reg <= 8'hb1;
            8'hd9: out_reg <= 8'hb3;
            8'hda: out_reg <= 8'hb5;
            8'hdb: out_reg <= 8'hb6;
            8'hdc: out_reg <= 8'hb8;
            8'hdd: out_reg <= 8'hba;
            8'hde: out_reg <= 8'hbc;
            8'hdf: out_reg <= 8'hbe;
            8'he0: out_reg <= 8'hc0;
            8'he1: out_reg <= 8'hc2;
            8'he2: out_reg <= 8'hc4;
            8'he3: out_reg <= 8'hc5;
            8'he4: out_reg <= 8'hc7;
            8'he5: out_reg <= 8'hc9;
            8'he6: out_reg <= 8'hcb;
            8'he7: out_reg <= 8'hcd;
            8'he8: out_reg <= 8'hcf;
            8'he9: out_reg <= 8'hd1;
            8'hea: out_reg <= 8'hd3;
            8'heb: out_reg <= 8'hd5;
            8'hec: out_reg <= 8'hd7;
            8'hed: out_reg <= 8'hd9;
            8'hee: out_reg <= 8'hdb;
            8'hef: out_reg <= 8'hdd;
            8'hf0: out_reg <= 8'hdf;
            8'hf1: out_reg <= 8'he1;
            8'hf2: out_reg <= 8'he3;
            8'hf3: out_reg <= 8'he5;
            8'hf4: out_reg <= 8'he7;
            8'hf5: out_reg <= 8'hea;
            8'hf6: out_reg <= 8'hec;
            8'hf7: out_reg <= 8'hee;
            8'hf8: out_reg <= 8'hf0;
            8'hf9: out_reg <= 8'hf2;
            8'hfa: out_reg <= 8'hf4;
            8'hfb: out_reg <= 8'hf6;
            8'hfc: out_reg <= 8'hf8;
            8'hfd: out_reg <= 8'hfb;
            8'hfe: out_reg <= 8'hfd;
            8'hff: out_reg <= 8'hff;
            default: out_reg <= 8'h0;
        endcase
    end
endmodule