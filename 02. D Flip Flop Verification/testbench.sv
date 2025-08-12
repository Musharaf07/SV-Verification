//Testbench
`include "interface.sv"
`include "test.sv"

module testbench;
  intf inf();
  test tst(inf);

  d_ff dut (
    .d(inf.d),
    .rst(inf.rst),
    .clk(inf.clk),
    .q(inf.q)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #500;
    $finish;
  end

  initial inf.clk = 0;
  always #5 inf.clk = ~inf.clk;
endmodule
