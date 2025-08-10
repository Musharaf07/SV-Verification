//Agent Class
class agent;
  generator gen;
  driver drv;
  monitor montr;
  
  mailbox gen2driv;
  mailbox mntr2scb;
  virtual intf vintf;
  
  function new(virtual intf vintf, mailbox mntr2scb);
    this.vintf = vintf;      
    this.mntr2scb = mntr2scb;
    this.gen2driv = new();
    
    gen = new(gen2driv);
    drv = new(vintf, gen2driv);
    montr = new(vintf, mntr2scb);
  endfunction
  
  task run();
    fork
      gen.run();
      drv.run();
      montr.run();
    join
  endtask
endclass
  
  
 
