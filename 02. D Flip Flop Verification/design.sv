// D Flip Flop 
module d_ff (
  input d, rst, clk,
  output reg q
);
  always @(posedge clk) begin
    if (rst)
      q <= 0;
    else
      q <= d;
  end
endmodule
