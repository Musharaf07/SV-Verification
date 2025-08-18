//Testbench
`include "interface.sv"
`include "test.sv"

module testbench;
  intf inf();
  test tst(inf);
  

  SRAM dut (
    .clk(inf.clk),
    .rst(inf.rst),
    .wr(inf.wr),
    .addrs(inf.addrs),
    .din(inf.din),
    .dout(inf.dout));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
   
  end

  initial begin
    inf.clk = 0;
    #4;
    inf.wr   = 0;
    inf.rst = 1;
    #5;
    inf.rst = 0;
     #300;
    $finish;
    
    
  end
  always #5 inf.clk = ~inf.clk;
endmodule
