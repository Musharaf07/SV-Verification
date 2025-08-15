//Agent Class
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"

class agent;
  generator gen;
  driver drv;
  monitor mon;
  
  mailbox g2d;
  mailbox m2s;
  event s2g;
  virtual intf vif;
  
  function new(virtual intf vif, mailbox m2s, event s2g);
    this.s2g = s2g;
    this.vif = vif;
    this.m2s = m2s;
    
    g2d = new();
    gen = new(g2d, s2g);
    drv = new(vif, g2d);
    mon = new(vif, m2s);
  endfunction
  
  task run();
    fork
      gen.run();
      drv.run();
      mon.run();
    join
  endtask
endclass

    
