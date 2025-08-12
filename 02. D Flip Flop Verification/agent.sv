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
  event sb2gr;
  virtual intf vintf;

  function new(virtual intf vintf, mailbox m2s, event sb2gr);
    this.vintf = vintf;
    this.m2s = m2s;
    this.sb2gr = sb2gr;
    this.g2d = new();
  
    gen = new(g2d, sb2gr);
    drv = new(vintf, g2d);
    mon = new(vintf, m2s);
  endfunction

  task run();
    fork
      gen.run();
      drv.run();
      mon.run();
    join
  endtask
endclass
