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
    input button,
    output reg a0,
    output reg a1,
    output reg a2,
    output reg a3,
    output reg a4,
    output reg a5,
    output reg a6,
    output reg a7,
    output reg a8,
    output reg a9,
    output reg a10,
    output reg a11,
    output reg a12,
    output reg a13,
    output reg a14,
    output reg a15,
    output reg di0,
    output reg di1,
    output reg di2,
    input button2
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_slowclock_value;
  reg [1-1:0] M_slowclock_rst;
  counter_2 slowclock (
    .clk(clk),
    .rst(M_slowclock_rst),
    .value(M_slowclock_value)
  );
  wire [1-1:0] M_btn_cond_out;
  reg [1-1:0] M_btn_cond_in;
  button_conditioner_3 btn_cond (
    .clk(clk),
    .in(M_btn_cond_in),
    .out(M_btn_cond_out)
  );
  wire [1-1:0] M_dif_cond_out;
  reg [1-1:0] M_dif_cond_in;
  button_conditioner_3 dif_cond (
    .clk(clk),
    .in(M_dif_cond_in),
    .out(M_dif_cond_out)
  );
  wire [1-1:0] M_edge_out;
  reg [1-1:0] M_edge_in;
  edge_detector_5 L_edge (
    .clk(clk),
    .in(M_edge_in),
    .out(M_edge_out)
  );
  wire [1-1:0] M_edge2_out;
  reg [1-1:0] M_edge2_in;
  edge_detector_5 edge2 (
    .clk(clk),
    .in(M_edge2_in),
    .out(M_edge2_out)
  );
  wire [16-1:0] M_nums_out;
  reg [1-1:0] M_nums_en;
  reg [32-1:0] M_nums_seed;
  gen_7 nums (
    .clk(clk),
    .rst(rst),
    .en(M_nums_en),
    .seed(M_nums_seed),
    .out(M_nums_out)
  );
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [20-1:0] M_seg_chars;
  display_8 seg (
    .clk(clk),
    .rst(rst),
    .chars(M_seg_chars),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [1-1:0] M_reward_out;
  wire [3-1:0] M_reward_diff;
  reg [1-1:0] M_reward_diffchange;
  reg [16-1:0] M_reward_num;
  difficulty_9 reward (
    .clk(clk),
    .rst(rst),
    .diffchange(M_reward_diffchange),
    .num(M_reward_num),
    .out(M_reward_out),
    .diff(M_reward_diff)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_slowclock_rst = rst;
    io_led = 24'h000000;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    M_reward_diffchange = 1'h0;
    M_btn_cond_in = button;
    M_dif_cond_in = button2;
    M_edge2_in = M_dif_cond_out;
    if (M_edge2_out) begin
      M_reward_diffchange = 1'h1;
    end
    M_reward_num = M_nums_out[0+15-:16];
    M_edge_in = M_btn_cond_out;
    M_nums_en = M_edge_out;
    a0 = M_nums_out[0+0-:1];
    a1 = M_nums_out[1+0-:1];
    a2 = M_nums_out[2+0-:1];
    a3 = M_nums_out[3+0-:1];
    a4 = M_nums_out[4+0-:1];
    a5 = M_nums_out[5+0-:1];
    a6 = M_nums_out[6+0-:1];
    a7 = M_nums_out[7+0-:1];
    a8 = M_nums_out[8+0-:1];
    a9 = M_nums_out[9+0-:1];
    a10 = M_nums_out[10+0-:1];
    a11 = M_nums_out[11+0-:1];
    a12 = M_nums_out[12+0-:1];
    a13 = M_nums_out[13+0-:1];
    a14 = M_nums_out[14+0-:1];
    a15 = M_nums_out[15+0-:1];
    di0 = M_reward_diff[0+0-:1];
    di1 = M_reward_diff[1+0-:1];
    di2 = M_reward_diff[2+0-:1];
    if (M_reward_out == 1'h0) begin
      io_led[8+7-:8] = M_nums_out[8+7-:8];
      io_led[0+7-:8] = M_nums_out[0+7-:8];
      a0 = M_nums_out[0+0-:1];
      a1 = M_nums_out[1+0-:1];
      a2 = M_nums_out[2+0-:1];
      a3 = M_nums_out[3+0-:1];
      a4 = M_nums_out[4+0-:1];
      a5 = M_nums_out[5+0-:1];
      a6 = M_nums_out[6+0-:1];
      a7 = M_nums_out[7+0-:1];
      a8 = M_nums_out[8+0-:1];
      a9 = M_nums_out[9+0-:1];
      a10 = M_nums_out[10+0-:1];
      a11 = M_nums_out[11+0-:1];
      a12 = M_nums_out[12+0-:1];
      a13 = M_nums_out[13+0-:1];
      a14 = M_nums_out[14+0-:1];
      a15 = M_nums_out[15+0-:1];
    end
    if (M_reward_out == 1'h1) begin
      if (M_nums_out[0+0-:1] == 1'h1) begin
        io_led[0+0+0-:1] = M_slowclock_value;
        a0 = M_slowclock_value;
      end
      if (M_nums_out[1+0-:1] == 1'h1) begin
        io_led[0+1+0-:1] = M_slowclock_value;
        a1 = M_slowclock_value;
      end
      if (M_nums_out[2+0-:1] == 1'h1) begin
        io_led[0+2+0-:1] = M_slowclock_value;
        a2 = M_slowclock_value;
      end
      if (M_nums_out[3+0-:1] == 1'h1) begin
        io_led[0+3+0-:1] = M_slowclock_value;
        a3 = M_slowclock_value;
      end
      if (M_nums_out[4+0-:1] == 1'h1) begin
        io_led[0+4+0-:1] = M_slowclock_value;
        a4 = M_slowclock_value;
      end
      if (M_nums_out[5+0-:1] == 1'h1) begin
        io_led[0+5+0-:1] = M_slowclock_value;
        a5 = M_slowclock_value;
      end
      if (M_nums_out[6+0-:1] == 1'h1) begin
        io_led[0+6+0-:1] = M_slowclock_value;
        a6 = M_slowclock_value;
      end
      if (M_nums_out[7+0-:1] == 1'h1) begin
        io_led[0+7+0-:1] = M_slowclock_value;
        a7 = M_slowclock_value;
      end
      if (M_nums_out[8+0-:1] == 1'h1) begin
        io_led[8+0+0-:1] = M_slowclock_value;
        a8 = M_slowclock_value;
      end
      if (M_nums_out[9+0-:1] == 1'h1) begin
        io_led[8+1+0-:1] = M_slowclock_value;
        a9 = M_slowclock_value;
      end
      if (M_nums_out[10+0-:1] == 1'h1) begin
        io_led[8+2+0-:1] = M_slowclock_value;
        a10 = M_slowclock_value;
      end
      if (M_nums_out[11+0-:1] == 1'h1) begin
        io_led[8+3+0-:1] = M_slowclock_value;
        a11 = M_slowclock_value;
      end
      if (M_nums_out[12+0-:1] == 1'h1) begin
        io_led[8+4+0-:1] = M_slowclock_value;
        a12 = M_slowclock_value;
      end
      if (M_nums_out[13+0-:1] == 1'h1) begin
        io_led[8+5+0-:1] = M_slowclock_value;
        a13 = M_slowclock_value;
      end
      if (M_nums_out[14+0-:1] == 1'h1) begin
        io_led[8+6+0-:1] = M_slowclock_value;
        a14 = M_slowclock_value;
      end
      if (M_nums_out[15+0-:1] == 1'h1) begin
        io_led[8+7+0-:1] = M_slowclock_value;
        a15 = M_slowclock_value;
      end
    end
    M_nums_seed[24+7-:8] = 8'h55;
    M_nums_seed[16+7-:8] = io_dip[16+7-:8];
    M_nums_seed[8+7-:8] = io_dip[8+7-:8];
    M_nums_seed[0+7-:8] = io_dip[0+7-:8];
    M_seg_chars = 20'h00000;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
  end
endmodule
