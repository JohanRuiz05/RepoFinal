`default_nettype none

module tt_um_mult_4 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  reg resetn;
  /* verilator lint_on SYNCASYNCNET */
  always @(negedge clk) resetn <= rst_n;

      mult_4 mult_4(
      .clk(clk),
      .rst(resetn),
      .init(uio_in[0]),
      .A(ui_in[3:0]),
      .B(ui_in[7:4]),
      .pp(uo_out[7:0]),
      .done(uio_out[1])
   );
  
  // All output pins must be assigned. If not used, assign to 0
  assign uio_out[7:2] = 0;
  assign uio_out[0] = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
    wire _unused = &{ena, uio_oe[7:0],uio_in[7:1], uio_out[7:2], uio_out[0], 1'b0};

endmodule

  module mult_4 (clk , rst , init , A , B , pp , done);
  
  input clk;
  input rst;
  input init;
  input [3:0] A;
  input [3:0] B;
  output [7:0] pp;
  output done;

  wire w_sh;
  wire w_reset;
  wire w_add;
  wire w_z;
  
  wire [7:0] w_A;
  wire [3:0] w_B;
  
 
  rsr rsr0 (.clk(clk), .in_B(B) , .shift(w_sh) , .load(w_reset) , .s_B(w_B));
  lsr lsr0 (.clk(clk), .in_A(A) , .shift(w_sh) , .load(w_reset) , .s_A(w_A));
  comp comp0(.B(w_B), .z(w_z));
  acc acc0 (.clk(clk), .A(w_A) , .add(w_add), .rst(w_reset), .pp(pp));
  control_mult control0 (.clk(clk), .rst(rst) , .lsb_B(w_B[0]) , .init(init) , .z(w_z) , .done(done) , .sh(w_sh) , .reset(w_reset) , .add(w_add) );
  

endmodule



