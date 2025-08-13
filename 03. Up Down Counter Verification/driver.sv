//Driver Class
class driver;
  virtual intf vif;
  mailbox g2d;
  transaction tr;
  
  function new (virtual intf vif, mailbox g2d);
    this.vif = vif;
    this.g2d = g2d; 
  endfunction
  
  task run();
    forever
      begin
        g2d.get(tr);
        vif.rst <= tr.rst;
        vif.d <= tr.d;
        tr.display("Driver");
       
      end
  endtask
endclass
