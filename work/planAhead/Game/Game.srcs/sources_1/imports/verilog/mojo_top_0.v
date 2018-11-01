/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    input [6:0] alufn
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam A_modes = 2'd0;
  localparam B_modes = 2'd1;
  localparam EQ_modes = 2'd2;
  localparam AUTO_modes = 2'd3;
  
  reg [1:0] M_modes_d, M_modes_q = A_modes;
  reg [15:0] M_a_d, M_a_q = 1'h0;
  reg [15:0] M_b_d, M_b_q = 1'h0;
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [20-1:0] M_seg_chars;
  display_2 seg (
    .clk(clk),
    .rst(rst),
    .chars(M_seg_chars),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  
  wire [16-1:0] M_alu16_out;
  wire [1-1:0] M_alu16_z;
  wire [1-1:0] M_alu16_v;
  wire [1-1:0] M_alu16_n;
  reg [7-1:0] M_alu16_alufn;
  reg [16-1:0] M_alu16_a;
  reg [16-1:0] M_alu16_b;
  reg [1-1:0] M_alu16_e;
  alu_3 alu16 (
    .alufn(M_alu16_alufn),
    .a(M_alu16_a),
    .b(M_alu16_b),
    .e(M_alu16_e),
    .out(M_alu16_out),
    .z(M_alu16_z),
    .v(M_alu16_v),
    .n(M_alu16_n)
  );
  
  always @* begin
    M_modes_d = M_modes_q;
    M_b_d = M_b_q;
    M_a_d = M_a_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_seg_chars = 20'h00000;
    M_alu16_alufn = 7'h00;
    M_alu16_a = M_a_q;
    M_alu16_b = M_b_q;
    M_alu16_alufn = io_dip[16+0+6-:7];
    if (io_dip[16+7+0-:1] == 1'h1) begin
      M_alu16_e = 1'h1;
    end else begin
      M_alu16_e = 1'h0;
    end
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    io_led = 24'h000000;
    
    case (M_modes_q)
      A_modes: begin
        M_seg_chars = 20'h10000;
        M_a_d[8+7-:8] = io_dip[8+7-:8];
        M_a_d[0+7-:8] = io_dip[0+7-:8];
        io_led[0+7-:8] = io_dip[0+7-:8];
        io_led[8+7-:8] = io_dip[8+7-:8];
        if (io_button[2+0-:1] == 1'h1) begin
          M_modes_d = AUTO_modes;
        end
        if (io_button[0+0-:1] == 1'h1) begin
          M_modes_d = B_modes;
        end
      end
      B_modes: begin
        M_seg_chars = 20'h50000;
        M_b_d[8+7-:8] = io_dip[8+7-:8];
        M_b_d[0+7-:8] = io_dip[0+7-:8];
        io_led[0+7-:8] = io_dip[0+7-:8];
        io_led[8+7-:8] = io_dip[8+7-:8];
        if (io_button[2+0-:1] == 1'h1) begin
          M_modes_d = AUTO_modes;
        end
        if (io_button[1+0-:1] == 1'h1) begin
          M_modes_d = EQ_modes;
        end
      end
      EQ_modes: begin
        io_led[0+7-:8] = M_alu16_out[0+7-:8];
        io_led[8+7-:8] = M_alu16_out[8+7-:8];
        io_led[16+3+4-:5] = 5'h00;
        io_led[16+2+0-:1] = M_alu16_z;
        io_led[16+1+0-:1] = M_alu16_v;
        io_led[16+0+0-:1] = M_alu16_n;
        if (io_button[2+0-:1] == 1'h1) begin
          M_modes_d = AUTO_modes;
        end
      end
      AUTO_modes: begin
        io_led = 24'h000000;
      end
    endcase
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_a_q <= 1'h0;
      M_b_q <= 1'h0;
      M_modes_q <= 1'h0;
    end else begin
      M_a_q <= M_a_d;
      M_b_q <= M_b_d;
      M_modes_q <= M_modes_d;
    end
  end
  
endmodule
