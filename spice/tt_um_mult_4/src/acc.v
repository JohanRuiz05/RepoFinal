module acc (clk , A, add, rst, pp);
  input clk;
  input [7:0] A;
  input add;
  input rst; 
  output reg [7:0] pp;

initial pp = 0;

always @(negedge clk)
  if (rst) 
   pp = 8'h00;
  else
     begin
      if (add) pp = pp + A;
      else pp = pp;
     end
endmodule