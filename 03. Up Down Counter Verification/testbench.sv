//Testbench
`include "interface.sv"
`include "test.sv"

module testbench;
  intf inf();
  test tst(inf);
  
  up_dn_cntr dut (
    .d(inf.d),
    .rst(inf.rst),
    .clk(inf.clk),
    .cnt(inf.cnt)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
   
  end

  initial begin
    inf.clk = 0;
    #4;
    inf.d   = 0;
    inf.rst = 1;
    #5;
    inf.rst = 0;
     #300;
    $finish;  
  end
  always #5 inf.clk = ~inf.clk;
endmodule
