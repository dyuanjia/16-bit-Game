/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_6 (
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n,
    input [6:0] alufn
  );
  
  
  
  reg [15:0] msbout;
  
  reg [15:0] xb;
  
  always @* begin
    if (alufn[0+0-:1] == 1'h0) begin
      xb = $signed(b);
      msbout = $signed(a) + $signed(xb);
    end else begin
      xb = ~b;
      msbout = $signed(a) + $signed(xb) + 1'h1;
    end
    if (msbout == 1'h0) begin
      z = 1'h1;
    end else begin
      z = 1'h0;
    end
    if (msbout[15+0-:1] == 1'h1) begin
      n = 1'h1;
    end else begin
      n = 1'h0;
    end
    if ((msbout[15+0-:1] == 1'h1 && a[15+0-:1] == 1'h0 && xb[15+0-:1] == 1'h0) || (msbout[15+0-:1] == 1'h0 && a[15+0-:1] == 1'h1 && xb[15+0-:1] == 1'h1)) begin
      v = 1'h1;
    end else begin
      v = 1'h0;
    end
    out = msbout[0+15-:16];
  end
endmodule