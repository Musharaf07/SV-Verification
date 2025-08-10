//Environment Class
class environment;
  agent agt;
  scoreboard scrbd;		
  mailbox mntr2scb;
  
  function new( virtual intf vitf);
    mntr2scb = new();
    agt = new(vitf, mntr2scb);
    scrbd = new(mntr2scb);
  endfunction
  
  task run();
    fork
      agt.run();
      scrbd.run();
    join
  endtask
endclass
