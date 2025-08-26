//Testbench
`include "interface.sv"
`include "test.sv"

module tb_fifo;

  intf vif();
  test tst(vif);

 fifo dut
  (
    .clk(vif.clk),
    .rst(vif.rst),
    .wr_en(vif.wr_en),
    .rd_en(vif.rd_en),
    .din(vif.din),
    .dout(vif.dout),
    .empty(vif.empty),
    .full(vif.full)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    vif.clk = 0;
    forever #5 vif.clk = ~vif.clk;
  end

  initial begin
    vif.rst = 0;
    vif.wr_en = 0;
    vif.rd_en = 0;
    vif.din = 0;
    #20;
    vif.rst = 1;
  end

endmodule
