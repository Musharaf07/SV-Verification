// Up Down Counter
module up_dn_cntr (
  input clk, rst, d,
  output reg [3:0] cnt
);

  always @(posedge clk) begin
    if (rst)
      cnt <= 4'd0;
    else if (d)
      cnt <= cnt + 4'd1;
    else
      cnt <= cnt - 4'd1;
  end

endmodule
