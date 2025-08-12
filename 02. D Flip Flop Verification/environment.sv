//Environment Class
`include "agent.sv"
`include "scoreboard.sv"

class environment;
  agent agt;
  scoreboard scrbd;
  mailbox m2s;
  event sb2gr;

  function new(virtual intf vintf);
    m2s = new();
    agt = new(vintf, m2s, sb2gr);
    scrbd = new(m2s,sb2gr);
  endfunction

  task run();
    fork
      agt.run();
      scrbd.run();
    join
  endtask
endclass
