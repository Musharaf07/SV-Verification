// Testbench   
`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"
`include "test.sv"

module testbench;
  intf inf();
  test tst(inf);
  full_adder fa(
    .a(inf.a),
    .b(inf.b),
    .cin(inf.cin),
    .sum(inf.sum),
    .cout(inf.cout)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    #50;
    $finish;
  end
endmodule
