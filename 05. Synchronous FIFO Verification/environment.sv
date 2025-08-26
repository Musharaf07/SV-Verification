//Environment Class

`include "agent.sv"
`include "scoreboard.sv"

class environment;
  agent agt;
  scoreboard sb;
  mailbox m2s;
  event s2g;

  function new(virtual intf vif);
    m2s = new();
    agt = new(vif, m2s, s2g);
    sb = new(m2s, s2g);
  endfunction

  task run();
    fork
      agt.run();
      sb.run();
    join
  endtask
endclass
