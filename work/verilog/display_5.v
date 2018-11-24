/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module display_5 (
    input clk,
    input rst,
    input [19:0] chars,
    output reg [6:0] seg,
    output reg [3:0] sel
  );
  
  
  
  localparam DIV = 5'h10;
  
  reg [17:0] M_ctr_d, M_ctr_q = 1'h0;
  
  wire [7-1:0] M_characs_segs;
  reg [5-1:0] M_characs_char;
  char_9 characs (
    .char(M_characs_char),
    .segs(M_characs_segs)
  );
  
  wire [4-1:0] M_dec_out;
  reg [2-1:0] M_dec_in;
  decoder_10 dec (
    .in(M_dec_in),
    .out(M_dec_out)
  );
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    M_characs_char = chars[(M_ctr_q[16+1-:2])*5+4-:5];
    seg = M_characs_segs;
    M_dec_in = M_ctr_q[16+1-:2];
    sel = M_dec_out;
    M_ctr_d = M_ctr_q + 1'h1;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule